Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 27 Sep 2016 10:01:15 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v9 17/19] drm/virtio: kconfig: Fix recursive dependency
 issue.
Message-ID: <20160927170115.GD7509@tuxbot>
References: <1473081421-16555-1-git-send-email-peter.griffin@linaro.org>
 <1473081421-16555-18-git-send-email-peter.griffin@linaro.org>
 <CACvgo52_g7anGBd9HTUyYsbp5QmQEk9LR3nNHgSTgjQ29G3ViA@mail.gmail.com>
 <20160920083251.GB26093@griffinp-ThinkPad-X1-Carbon-2nd>
 <CACvgo53fuoPVjBAkZbWFPVxosObjvxoDgFdR_BkSTgevqyGg9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACvgo53fuoPVjBAkZbWFPVxosObjvxoDgFdR_BkSTgevqyGg9g@mail.gmail.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Arnd Bergmann <arnd@arndb.de>, LAKML <linux-arm-kernel@lists.infradead.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, dan.j.williams@intel.com, David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, ohad@wizery.com, devicetree <devicetree@vger.kernel.org>, linux-remoteproc@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>, dmaengine@vger.kernel.org, lee.jones@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 21 Sep 05:09 PDT 2016, Emil Velikov wrote:

> On 20 September 2016 at 09:32, Peter Griffin <peter.griffin@linaro.org> wrote:
> > Hi Emil,
> >
> > On Tue, 20 Sep 2016, Emil Velikov wrote:
> >
> >> On 5 September 2016 at 14:16, Peter Griffin <peter.griffin@linaro.org> wrote:
> >> > ST_SLIM_REMOTEPROC must select REMOTEPROC, which exposes the following
> >> > recursive dependency.
> >
> >
> >> >
> >> From a humble skim through remoteproc, drm and a few other subsystems
> >> I think the above is wrong. All the drivers (outside of remoteproc),
> >> that I've seen, depend on the core component, they don't select it.
> >
> > I will let Bjorn comment on the remoteproc subsystem Kconfig design, and
> > why it is like it is.
> >
> > For this particular SLIM_RPROC I have added it to Kconfig in keeping with all
> > the other drivers in the remoteproc subsystem which has exposed this recursive
> > dependency issue.
> >
> > For this particular kconfig symbol a quick grep reveals more drivers in
> > the kernel using 'select', than 'depend on'
> >
> > git grep "select VIRTIO" | wc -l
> > 14
> >
> > git grep "depends on VIRTIO" | wc -l
> > 10
> >
> Might be worth taking a closer look into these at some point.
> 

The general idea here is that VIRTIO provides the "framework" and as
such drivers implementing VIRTIO do select and drivers using virtio use
depends.

This is found in several places around the kernel.

> >
> >> Furthermore most places explicitly hide the drivers from the menu if
> >> the core component isn't enabled.
> >
> > Remoteproc subsystem takes a different approach, the core code is only enabled
> > if a driver which relies on it is enabled. This IMHO makes sense, as
> > remoteproc is not widely used (only a few particular ARM SoC's).
> >
> > It is true that for subsystems which rely on the core component being
> > explicitly enabled, they often tend to hide drivers which depend on it
> > from the menu unless it is. This also makes sense.
> >
> >>
> >> Is there something that requires such a different/unusual behaviour in
> >> remoteproc ?
> >>

There's nothing unusual in remoteproc that forces us to stay with this
model; however the parts related to the REMOTEPROC config is useless by
themselves.

Regards,
Bjorn
