Return-Path: <broonie@sirena.org.uk>
Date: Thu, 21 Feb 2019 11:28:24 +0000
From: Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [v4,00/14] ASoC: Sound Open Firmware (SOF) core
Message-ID: <20190221112824.GC5970@sirena.org.uk>
References: <20190213220734.10471-1-pierre-louis.bossart@linux.intel.com>
 <1550520188-9253-1-git-send-email-xiaoxiang@xiaomi.com>
 <2ad7bf66-a0a9-b97d-e1b1-48e3f9c699c5@linaro.org>
 <CAH2Cfb8XZTD1a+2vm2W7mB8Bfyb1v-ArCw8rf0+TjXGPK0msKg@mail.gmail.com>
 <a499dec8-ed61-dd9a-77dc-e60225f79e46@linux.intel.com>
 <20190221043925.GF2736@vkoul-mobl>
 <1af21f7e-1ea1-98a0-cf6d-74d0f4e5b186@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Content-Disposition: inline
In-Reply-To: <1af21f7e-1ea1-98a0-cf6d-74d0f4e5b186@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Vinod Koul <vkoul@kernel.org>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, xiang xiao <xiaoxiang781216@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Daniel Baluta <daniel.baluta@gmail.com>, Kumar Gala <kumar.gala@linaro.org>, "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "tiwai@suse.de" <tiwai@suse.de>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>, Xiang Xiao <xiaoxiang@xiaomi.com>, "sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>, "wendy.liang@xilinx.com" <wendy.liang@xilinx.com>, Alan Cox <alan@linux.intel.com>
List-ID: <linux-remoteproc@vger.kernel.org>


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 21, 2019 at 11:42:25AM +0100, Arnaud Pouliquen wrote:
> On 2/21/19 5:39 AM, Vinod Koul wrote:
> > On 19-02-19, 09:55, Pierre-Louis Bossart wrote:
> >> On 2/19/19 9:09 AM, xiang xiao wrote:

> > Rather than evolve the IPC, i would say it makes more sense that we
> > "reuse" existing upstream frameworks.. As given below by xiang
> > this seems to have support for RTOSes (see point 4 below) and looking at
> > below it seems to have much better coverage across systems.

> > This should also help in easy adoption of SoF for non Intel people...

> > Also looking at it, lot of IPC code, DSP loading etc would go away
> > making SoF code lesser in footprint.

> > I think benefits outweigh the effort of porting to a framework which is
> > already upstream and used on many platforms for different vendors!

> Just for information... ST Microelectronics plans to port SOF to at
> least one of its platforms (based on ARM cores). Today, for the
> co-processor  management we use the rpmsg and remoteproc frameworks on
> the Linux kernel side and OpenAMP on the remote processor side. We are
> therefore interested in xiang's work.
> An advantage we see in this generic solution is that compatibility
> between the Linux kernel frameworks and the OpenAMP library is ensured
> through discussions in the Linux and OpenAMP communities, involving
> maintainers and several vendors.

This is a very good point, especially with people actually jumping on it
if we can avoid having multiple ABIs to worry about that would make life
a lot easier.  We should at least figure out if it will be disruptive to
adapt it later on, even if Intel ends up continuing to use a custom
system integration.

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxui1cACgkQJNaLcl1U
h9Af6gf9EDATFZKplMkYwZcj1R2AQS86EbQOhKcGcedXfpPHtM1W1Y0b1jzpvMD6
r8GHrfbNhkZ5PDF5aetBsbHbg5kfyd8kgt1X/rOBnAaJx9hymExKvLKwJfmvU/Eb
mT7/vMbHsgVXhEwXsoPpzfuSJUeaZUX3754qPrezZqx4qiTrQyeePoJcrHeppf7k
eOjie8M3i/lrRCtRa71ZjsPyTT8UR65DzQorAsEcn1LjjRlFEk425Kp+jXj0Ii64
XIhEp/TQxco3f79GEffO7uTU7de7Nu00/Af+SNXcmSphnnb2/5K7ihWFT4IFT9/W
nWHAwEWDGmCJTwJH8ZO5bMXdJtLdBQ==
=9xY7
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--
