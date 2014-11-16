class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new

    # MOVIE ID
    movie_id = params[:select_movie][:movie][:id]

    # API CALL FOR MOVIE TRAILER
    security_key = fandango_api()
    data = HTTParty.get("http://api.fandango.com/v1/?op=videolookup&movieid="+ movie_id +"&" + security_key).parsed_response
    @select_movie = data['videolookupresponse']['data']['movies']['movie']['videos']['video']
  end

    # SHOW MOVIE
  def show_movie
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)
    movie = Movie.find(params[:movie_id])
    @challenge.movie_id =  Movie.find(params[:movie_id]).id
    @challenge.user_id = User.find(params[:user_id]).id

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @challenge }
      else
        format.html { render action: 'new' }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:movie_id, :user_id, :ticket, :trailer, :checkin, :quiz, :fblike, :fbshare, :tfollow, :tweet)
    end
end
