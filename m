Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
Date: Fri, 3 Jun 2016 13:47:33 +0100
From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v4 18/18] ARM: DT: STi: stihxxx-b2120: Add DT nodes for
 STi audio card
Message-ID: <20160603124733.GB9912@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1464192412-16386-1-git-send-email-peter.griffin@linaro.org>
 <1464192412-16386-20-git-send-email-peter.griffin@linaro.org>
 <574D6473.7050902@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <574D6473.7050902@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com, ohad@wizery.com, bjorn.andersson@linaro.org, arnd@arndb.de, lee.jones@linaro.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Arnaud,

Thanks for reviewing.

On Tue, 31 May 2016, Arnaud Pouliquen wrote:

> 
> 
> On 05/25/2016 06:06 PM, Peter Griffin wrote:
> > This patch enables the uniperif players 2 & 3 for b2120 boards
> > and also adds the "simple-audio-card" device node to interconnect
> > the SoC sound device and the codec.
> > 
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  arch/arm/boot/dts/stihxxx-b2120.dtsi | 40 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts/stihxxx-b2120.dtsi
> > index 722c63f..5297f21 100644
> > --- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
> > +++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
> > @@ -131,5 +131,45 @@
> >  				dvb-card	= <STV0367_TDA18212_NIMA_1>;
> >  			};
> >  		};
> > +
> > +		sti_uni_player2: sti-uni-player@2 {
> > +			status = "okay";
> > +		};
> > +
> > +		sti_uni_player3: sti-uni-player@3 {
> > +			status = "okay";
> > +		};
> enable sti-sasg-codec with spdif pinctrl

Will fix in v5

> > +
> > +		sound {
> > +			compatible = "simple-audio-card";
> > +			simple-audio-card,name = "sti audio card";
> > +			status = "okay";
> > +
> > +			simple-audio-card,dai-link@0 {
> > +				/* DAC */
> > +				format = "i2s";
> > +				dai-tdm-slot-width = <32>;
> clean dai-tdm-slot-width, not used.

Will fix in v5

regards,

Peter.
