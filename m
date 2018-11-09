Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 8 Nov 2018 20:23:26 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: Regression by commit 7e83cab824a86704cdbd7735c19d34e0ce423dc5
Message-ID: <20181109042326.GF2337@tuxbook-pro>
References: <CAH2Cfb_yqjYSNf62rvwsOGCG-x+XVNBGwdKrBCfuCO0B2SSSUQ@mail.gmail.com>
 <20181108062214.GY12063@builder>
 <CAH2Cfb-MCKk78J8x8fBhZdVHYN-eNHh6kL2iSXqmEMwrw-txPw@mail.gmail.com>
 <20181108072608.GF12063@builder>
 <CAH2Cfb9ZsFq=VNn_PyHcXPBXnFb_FjXWefFMSh0v5=p4BRi58Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2Cfb9ZsFq=VNn_PyHcXPBXnFb_FjXWefFMSh0v5=p4BRi58Q@mail.gmail.com>
To: xiang xiao <xiaoxiang781216@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, spjoshi@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 08 Nov 00:23 PST 2018, xiang xiao wrote:

> On Thu, Nov 8, 2018 at 3:22 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 07 Nov 22:36 PST 2018, xiang xiao wrote:
> >
> > > On Thu, Nov 8, 2018 at 2:18 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > On Wed 07 Nov 06:25 PST 2018, xiang xiao wrote:
> 
> > > > > When the crash happen, is it better to destroy and recreate all virtio
> > > > > device and it�s children(rpmsg device) again to match the remote side state
> > > > > like the original behavior?
> > > > >
> > > >
> > > > Yes, it's likely that the protocols on top does share some state, so we
> > > > do not have any choice but to report this up to the virtio device.
> > > >
> > > > Removing and re-probing the devices - rather than having some other form
> > > > of notification of this event - makes the code simpler.
> > > >
> > > >
> > > > But it seems we're trying to re-register the same device the second
> > > > time, rather than initialize a new one.
> > > >
> > > If we use one new here, the old need to be destroyed to avoid the leak.
> > > Basically, it's become the old approach again.
> > >
> >
> > You're right, for vdevs we must tear them down and bring them up again.
> >
> > The reason for introducing the offending commit was for carveouts to
> > be allocated past the stop() call, so that we can stop the core and
> > provide a coredump for post mortem debugging.
> >
> Why we need stop the remote core before making a coredump?
> Basically, the coredump is just a series memory copy, it isn't harmful
> to do it while the remote code is still live.

In order to support implementing e.g. parts of the DRM stack the memory
carveouts assigned to the remoteprocs on Qualcomm platforms is protected
from read and write accesses from the application CPU.

Therefor the remoteproc must be stopped before the content is accessed.

Regards,
Bjorn
