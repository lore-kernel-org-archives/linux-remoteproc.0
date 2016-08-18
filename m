Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 18 Aug 2016 11:09:40 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 08/14] rpmsg: Split rpmsg core and virtio backend
Message-ID: <20160818180940.GU26240@tuxbot>
References: <1471306640-29917-1-git-send-email-bjorn.andersson@linaro.org>
 <1471306640-29917-9-git-send-email-bjorn.andersson@linaro.org>
 <D0C04901035AEF47BB4C8387F4AA41F53C5D6F@SAFEX1NODE23.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D0C04901035AEF47BB4C8387F4AA41F53C5D6F@SAFEX1NODE23.st.com>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sricharan R <sricharan@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 18 Aug 04:59 PDT 2016, Loic PALLARDY wrote:

> 
> 
> > -----Original Message-----
> > From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-remoteproc-
> > owner@vger.kernel.org] On Behalf Of Bjorn Andersson
> > Sent: Tuesday, August 16, 2016 2:17 AM
> > To: Ohad Ben-Cohen <ohad@wizery.com>; Bjorn Andersson
> > <bjorn.andersson@linaro.org>
> > Cc: linux-remoteproc@vger.kernel.org; linux-arm-msm@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > Sricharan R <sricharan@codeaurora.org>
> > Subject: [PATCH 08/14] rpmsg: Split rpmsg core and virtio backend
> > 
> > Extract the generic rpmsg core functionality from the virtio rpmsg
> > implementation, splitting the implementation in a rpmsg core and a
> > virtio backend.
> > 
> > Based on initial work by Sricharan R <sricharan@codeaurora.org>
> > 
> > Cc: Sricharan R <sricharan@codeaurora.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/rpmsg/Kconfig            |   4 +
> >  drivers/rpmsg/Makefile           |   3 +-
> >  drivers/rpmsg/rpmsg_core.c       | 513
> > +++++++++++++++++++++++++++++++++++++++
> >  drivers/rpmsg/rpmsg_internal.h   |  45 ++++
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 477 +-----------------------------------
> Hi Bjorn,
> 
> Could you please regenerate the patch with  option -M (of git
> formatpatch) to detect file renames.  It will provide better
> visibility of differences between virtio_rpmsg_bus.c and rpmsg_core.c.

I believe this is with -M, but as I only extracted part of the file it
did not detect it as a rename. I will see if I can figure something out
for v2.

Perhaps if I split the move in more than one commit it will be easier to
follow; like take the device management in one chunk and the
rpmsg_send() functions in one would reduce the size of the two patches
quite a bit.

> 
> >  5 files changed, 569 insertions(+), 473 deletions(-)
> >  create mode 100644 drivers/rpmsg/rpmsg_core.c
> >  create mode 100644 drivers/rpmsg/rpmsg_internal.h
> > 
> > diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> > index 69a219387582..40614be88c97 100644
> > --- a/drivers/rpmsg/Kconfig
> > +++ b/drivers/rpmsg/Kconfig
> > @@ -3,6 +3,10 @@ menu "Rpmsg drivers"
> >  # RPMSG always gets selected by whoever wants it
> >  config RPMSG
> >  	tristate
> > +
> > +config RPMSG_VIRTIO
> > +	tristate
> > +	select RPMSG
> >  	select VIRTIO
> >  	select VIRTUALIZATION
> > 
> Remoteproc Kconfig should be changed too to select RPMSG_VIRTIO instead of RPMSG.
> 

You're right, forgot to include that. I still think this should be a
user selectable option, rather than being tied to particular remoteproc
drivers - but let's take that discussion separately.

Thanks,
Bjorn
