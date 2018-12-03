module Tests.Day02 exposing (suite)

import Day02
import Expect
import Test exposing (..)


suite : Test
suite =
    describe "Day02"
        [ describe "partOne"
            [ test "1" <|
                \_ ->
                    Day02.partOne partOneExample
                        |> Expect.equal 12
            , test "real" <|
                \_ ->
                    Day02.partOne input
                        |> Expect.equal 7350
            ]
        , describe "partTwo"
            [ test "1" <|
                \_ ->
                    Day02.partTwo partTwoExample
                        |> Expect.equal "fgij"
            , only <|
                test "real" <|
                    \_ ->
                        Day02.partTwo input
                            |> Expect.equal "Just (\"wmlnjevbfodamyiqpuycrhsukg\",\"wmlnjevbfodamyiqpuecrhsukg\")"
            ]
        ]


partOneExample : String
partOneExample =
    """
    abcdef
    bababc
    abbcde
    abcccd
    aabcdd
    abcdee
    ababab
    """


partTwoExample : String
partTwoExample =
    """
    abcde
    fghij
    klmno
    pqrst
    fguij
    axcye
    wvxyz
    """


input : String
input =
    """
    wxlnjevbfozadyiqpuzkrhstkg
    wxlsjivbfodamyiqpuzcxhstkg
    wxlnjevbfouammnqpuzcrhstkg
    wxlnjevbfobwmyiqpuzprhstkg
    wxlnjefbfodamyiqpuzcnustkg
    wxlnjevbfodakyyupuzcrhstkg
    wxlnjejbfodafynqpuzcrhstkg
    wxlnjevbfodomyifptzcrhstkg
    wxlnjevbfodamyiwcuzcrhstkz
    wxlnjevbfofamyiqpuznrhstxg
    wxlnjevbfodamyiqbupcrxstkg
    wxjnjevbfodxmyeqpuzcrhstkg
    xwlnjevbfosamyiqpuzcrhstkg
    fxlnjevbfodrmyiqpuzcrbstkg
    wxlnjevpfodamyiqquzzrhstkg
    wwlnjenbfodawyiqpuzcrhstkg
    wxrnjevbfodamyiqpuzlrhstrg
    welnjeqbfodkmyiqpuzcrhstkg
    walnjfvbfodamyiqpuzcrhwtkg
    wdlnjevbfodamriqpuzjrhstkg
    wxlnjevbfodmnyizpuzcrhstkg
    wxlnjevbfodgmyiqpuxcrjstkg
    wxlnjevbfkdamyiqpudcrestkg
    wxlyjevbfodamyiqpuzcehstkj
    wxlnjevamodamyiqpuzcrhatkg
    fxlnqevsfodamyiqpuzcrhstkg
    wqlnjevbfodanyiqvuzcrhstkg
    wxlnjevbfoiamyzqpuzcrnstkg
    wxlnjevbfodamyiqpuacrhsjig
    wxlnjuvbfodzmyvqpuzcrhstkg
    kxlnjevbfolamviqpuzcrhstkg
    wxlnjesbfldamyiqpuycrhstkg
    nxltjevbfodgmyiqpuzcrhstkg
    ojlnjevbfooamyiqpuzcrhstkg
    wxlnjevbfodaffiqpugcrhstkg
    cxlnievbfodamyuqpuzcrhstkg
    wxlouevbjodamyiqpuzcrhstkg
    wafnjevbfhdamyiqpuzcrhstkg
    wxlnjevbfxdamrpqpuzcrhstkg
    wxlnjepffodamyiqphzcrhstkg
    wxlnkevbfohamciqpuzcrhstkg
    wzlnmevdfodamyiqpuzcrhstkg
    wxlzjtvbfodamyiqpuzcrhstkd
    gxlnjehbfojamyiqpuzcrhstkg
    wxlnjeoqfodamyiqprzcrhstkg
    nxllvevbfodamyiqpuzcrhstkg
    wxlnjevtfomamyiqpurcrhstkg
    sxlnjevafodamyikpuzcrhstkg
    wxlnjevbfodamyfqpuzcyhztkg
    wxlnjevbfodamyiqpulnrhstkh
    wxlnwevbfodumyiqpuzqrhstkg
    wxldjevbfodamyiqpzzcrhstkk
    jxlnjevbfodamyiqphzcrnstkg
    fxlnjeibfodcmyiqpuzcrhstkg
    wxlnjevufodamyiqpnzcrhstkk
    wglnjevbfodamyiqpuzcesstkg
    wxlvjevbdodamyiqpuzcrhstkc
    wxlnjevbfodabyicpuzcrhstkl
    wxlnjevbfodamyiqpizcrhstvt
    wolnjevbfodawyiqiuzcrhstkg
    wxlyjevbfodamyuqpxzcrhstkg
    wxlijevbfodamyikpuzyrhstkg
    wxennevbfodamyiqpuzcrtstkg
    wxlnjevbyodamyuqpwzcrhstkg
    wxlnjevbfoiomyiqpuzcrhsteg
    wxlnjehbrodamyiqpuicrhstkg
    xxlnjevufodamyiqbuzcrhstkg
    wxlojevbfodamyiqpezcrhatkg
    wxljjevbfolamuiqpuzcrhstkg
    wxlnjevbfodamyiqruzcrhstpi
    wxlnjevbfomamyiqjnzcrhstkg
    wxlnjevbfodahyiqzuzcrhstpg
    wxtnjevbfodamyiqpuzcrhsdrg
    wxlnjevbfodamynrpuzcrhstkz
    wxlqjevefqdamyiqpuzcrhstkg
    wxlnjevbfmdamyiqnuzckhstkg
    wxlnjevbfodajyiqprzcrjstkg
    wxlnjqvbhodamyidpuzcrhstkg
    wxlnjhvbfodamriqpuzcchstkg
    wglnjevbfodamyiqpupfrhstkg
    wulnjevdfodamyiqpuzcrhsteg
    vxlojevbfodamyiqpuzcrhstsg
    wxlnjvvbfodamiiqpuzcrhttkg
    wxlnjevbfodabyiqpuzzrhetkg
    wxhnjevbfodamyiqpuwcrsstkg
    wslzjbvbfodamyiqpuzcrhstkg
    rxlnjevbfodhmyiqpupcrhstkg
    wxlnjevbfhdamyiqpuvcrhskkg
    wxlrjevbxodamyiqpuzcrhstag
    wxlsbevbfodammiqpuzcrhstkg
    wxlnjzvbfodemyiqpmzcrhstkg
    wxlnoevbfodgmyiqpuzbrhstkg
    wxlnjefbfodamyinpuzcrhwtkg
    bxlnjevbfwdamyiqpuocrhstkg
    cxlnjevbjodamyiqpuzcrhslkg
    wflnjevbforemyiqpuzcrhstkg
    wxlmjeoboodamyiqpuzcrhstkg
    wxlnjevbfadaiyiqpuzcrhutkg
    wxlnmevbfodamyyqpuzcrjstkg
    wxlnjovbfodamyippjzcrhstkg
    wxlnjmvbfodamyiqpszcrhsbkg
    wxlnjeebfodamyicpuxcrhstkg
    wxlnrehbfodamyiqpuzcrhytkg
    wxlnjevbfogamyiqwurcrhstkg
    wxlujevbnodamyiqpuzcrhstng
    wxlnoenofodamyiqpuzcrhstkg
    wxsnjevbfsdamyiqsuzcrhstkg
    wxlnjevwfodamyiqpuzxrhqtkg
    wxlnjevbnodamyiqxulcrhstkg
    wxlijetpfodamyiqpuzcrhstkg
    wxlnjzvbfidamyiqpuzcrbstkg
    wxlnjevefodavyiqpuzcthstkg
    wxlnjevbfozamyiqpurcrbstkg
    wxlnjfvpfodamyiqpuzcrhntkg
    wxlnjevbfvdamyiqvuzcrhqtkg
    wilejevbfodamyilpuzcrhstkg
    wxlnhevbfodamtiqpuzcrhstke
    wxlwjevbfodahyiqppzcrhstkg
    wxlnjevbfodamyuqpuzwrrstkg
    xxsnjevbfodamyiqpuzcrhstkl
    wglnjevbdodamyaqpuzcrhstkg
    wxlnjefbwodamyiqpuzcrhsykg
    wxwnjevbfodamyiqpuzcrhpckg
    wxlnjuvbfidamyiqpuzczhstkg
    wxlnzhybfodamyiqpuzcrhstkg
    wxunjevufodamyiqpuzcrhspkg
    wxunjevbfodcmyiqpuzcrhstcg
    wxlnjevbfodhwyiqpuxcrhstkg
    wxlnjevtfodasyiqpuzcrhstkb
    wxlvjevbfqdamyiqprzcrhstkg
    sxlnjevbfodamyiqplzcrhstkq
    wxlnlevbfodamyiqpuzcrpstka
    wxlnjevbfodaiyiqovzcrhstkg
    wxlntevbfodamyiqpuzcrkntkg
    wxlnjevbfodsmyiqpuzcrhstir
    wxlnnevbfodaoyiqpuzmrhstkg
    xxlnjevbfodamyinpnzcrhstkg
    wxlnjedefodamyigpuzcrhstkg
    wxlnxeabfodamyiqpnzcrhstkg
    wxlnxevbfodpmtiqpuzcrhstkg
    wxlnjevnfodamyiqpuzcuhqtkg
    wxlnjevbfodakyiqluzcrhstmg
    wxlnjevbaodamoiqpyzcrhstkg
    wwlnjevbfoaajyiqpuzcrhstkg
    wxlnjevbfedamyiqpuzcrhsang
    wxlwjevbfodamyiqpuzcrmdtkg
    wxlnjevbhodamyiqpmzxrhstkg
    wxlnjevbfodamyiqpuzzrhwtkj
    wxlnjevbfpdvmyiqpuzzrhstkg
    wxlnjegcfodamyiqpxzcrhstkg
    fxlnjevbfodamyiqpuzcrhstat
    wxlnjevbfodcmybqpuzcrkstkg
    wxlnjevbfodamiiqpuzrrhstxg
    wxvnjevifodamdiqpuzcrhstkg
    wxltjevbfodamyiqpuzmrhktkg
    wxlnjevbfobaaygqpuzcrhstkg
    wmlnjevbfodamyiqpuycrhsukg
    wxlnjevboodamyiqpuzcrhuhkg
    wxlnjevgfodaqyiqpuzcghstkg
    wxlnjevjnodamyiqpuzcrhstke
    wclnjevbfodamyiqpuncchstkg
    wxlnjevbfndamyxqpuzcshstkg
    rxldjevbfodamyiqpuvcrhstkg
    wxlnwevbfodamywqpuzrrhstkg
    ixlnjevbqodpmyiqpuzcrhstkg
    wxlnjlvbfocamyiqpuzgrhstkg
    wxlnjevffodamyiqnuzcrhutkg
    wxlajevbfodamyiqpuccrhshkg
    vwlnjevbfodamyiqpuzcrhstky
    wxlajevbfodamyiqpuzcfhstkl
    wxlnjevbfodamniqouzcrhstko
    wxlnjevbfodamyiqpuzqrhsqka
    wxlnjeybfodamyiqpuzclhsnkg
    wxbnjlvbfoyamyiqpuzcrhstkg
    wxbnjevbfodemyiqpuzcrhstkj
    wxlnbefbfodamyiqpkzcrhstkg
    wxlnjvvbyodamyitpuzcrhstkg
    jxlnjevbfopamyiqpuzprhstkg
    wxlnjevbfodaeyiupxzcrhstkg
    wnlnjevbfodamyqqpuzcrhstcg
    wxlxzuvbfodamyiqpuzcrhstkg
    wxlnjevbcodymyiqpuzcrhstke
    wxlnjezbfodamynqpuvcrhstkg
    wxlnjevbfodamyxlpuzcyhstkg
    wxlnjevbffdaiyiqpuzirhstkg
    wxlnjevbfodymyiqwuzcrhstfg
    wxlnzevbfodscyiqpuzcrhstkg
    hxlnjevbfodamyawpuzcrhstkg
    welnjevbfodamciqplzcrhstkg
    wxlnjeqbfodawyiqpuzkrhstkg
    wxlnjelbfodamviqpuzckhstkg
    wxlneevjfodamyiqpuzcrhstkd
    wxlnjevbfodamyaqpuytrhstkg
    wxlnjpvyfodamyiqpuzcshstkg
    wxlnjevbfodmbyiqpuzcrhstkp
    wxlnjegbfodamdiqpuzcrhstdg
    wmlnjevbfodamyiqpuecrhsukg
    wxlnjevbfodamyiqpuocrhwtjg
    jxfnwevbfodamyiqpuzcrhstkg
    wxlnjevffodamyiqpurcrhstkd
    wxlnjevbfofamyiqpuzcrhsmkt
    wxlnjevbfodmmyiqpuzcrdsttg
    axlnjevbfodgmyiqpuzerhstkg
    wxtnjevbfodamyifpuwcrhstkg
    wxlgjevbfodamyiqpuzrrhvtkg
    wxlnjevbfouamyeqfuzcrhstkg
    wxlnjevbfmxamyiqpuzcahstkg
    wxlnjevffoxamyiqpuecrhstkg
    wxlnyevbfodamyiqttzcrhstkg
    bxlnjevbfodzmysqpuzcrhstkg
    wxlnjevbfodayyiqpuzcrherkg
    yxlnjevbfodayyiqpuzcrwstkg
    wllnjevbfodambiqpuzurhstkg
    wxlnjevbfsdamyiqpuqcrhstkh
    wxlcjevbfodamyiqcuzcxhstkg
    wxlnjevbfodayticpuzcrhstkg
    wxltzevbfodamyiqpzzcrhstkg
    wxlnjevbfodamgiqpuzcphstng
    wxlnjevbfqdfmziqpuzcrhstkg
    wxlnaevbfodamyiqpuzcfustkg
    wxlnjevbfodamyxqxuzcrhstdg
    wxlnjevkbodamyiqpufcrhstkg
    whlnjevbfodauyiqputcrhstkg
    wxlnjevbfodamyiephzcrhsnkg
    wxlnjevbfodfmoiqpuzcrhstkf
    wxlnjevbfodamyiqxuzaxhstkg
    wxlnjevtfotamyiqpuzcrhsttg
    wxlgjevbfodamyiqpuhcrostkg
    dxlnjtvbfodamyiqpuzcshstkg
    wxlfjevbfodumyiqppzcrhstkg
    wxlnzevbfodamyiqpuzqrhstkx
    wflnjevbfodamyiqpurcrhsthg
    wxlnjevbfodzfyiqpuzcrjstkg
    wxlnjevbfrdamviqpuzmrhstkg
    wnlngevmfodamyiqpuzcrhstkg
    walzjevbfodamyiqpuzcrhsjkg
    wqlnjevbfodamyiqpuzcshslkg
    wxlnjevkfodfmyiepuzcrhstkg
    wxgnjehbfodamyhqpuzcrhstkg
    wxlnjevbfodamyiqfuacrostkg
    wxlnjexbfodamyiwpuzcrqstkg
    wxlntevafodamyiqpuzcrhsnkg
    wxvnjevbfodamyiqpuzcvistkg
    mxlnjeebfodamyiqpuzcrhsgkg
    wxlnjevyfodamyiqpuzcrhdtkf
    wxlnjcvbfodamyicpuzcrhsckg
    wxlnjekbfodlmyiqpuzcthstkg
    wxlnjvvbfodamyiopuzcrhstqg
    wxlnjevbsodamyiqpuhcrhstwg
    wxxnjevufodamyiqruzcrhstkg
    """
