Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
Date: Wed, 31 Aug 2016 12:11:36 +0100
From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v8 01/18] remoteproc: st_slim_rproc: add a slimcore rproc
 driver
Message-ID: <20160831111136.GA16490@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
 <1472223413-7254-2-git-send-email-peter.griffin@linaro.org>
 <20160830123453.GG10121@dell>
 <20160830165409.GM15161@tuxbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160830165409.GM15161@tuxbot>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, dan.j.williams@intel.com, airlied@linux.ie, kraxel@redhat.com, ohad@wizery.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On Tue, 30 Aug 2016, Bjorn Andersson wrote:

> On Tue 30 Aug 05:34 PDT 2016, Lee Jones wrote:
> 
> Thanks for your review Lee.
> 
> > On Fri, 26 Aug 2016, Peter Griffin wrote:
> [..]
> > > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > > index 1a8bf76a..06765e0 100644
> > > --- a/drivers/remoteproc/Kconfig
> > > +++ b/drivers/remoteproc/Kconfig
> > > @@ -100,4 +100,12 @@ config ST_REMOTEPROC
> > >  	  processor framework.
> > >  	  This can be either built-in or a loadable module.
> > >  
> > > +config ST_SLIM_REMOTEPROC
> > > +	tristate "ST Slim remoteproc support"
> > > +	select REMOTEPROC
> > > +	help
> > > +	  Say y here to support firmware loading on IP based around
> > > +	  the Slim core.
> > > +	  If unsure say N.
> 
> Saw one more thing when browsing through...
> 
> As this piece of code doesn't do anything on its own and is going to be
> selected by the "function driver" I don't think this should be
> user-selectable.

Applogies, I believe you pointed this out in a previous review, but it seems to
have slipped through the net. Will fix in the next version.

Regards,

Peter.
