Return-Path: <xiaoxiang781216@gmail.com>
MIME-Version: 1.0
References: <CAH2Cfb_yqjYSNf62rvwsOGCG-x+XVNBGwdKrBCfuCO0B2SSSUQ@mail.gmail.com>
 <20181108062214.GY12063@builder> <CAH2Cfb-MCKk78J8x8fBhZdVHYN-eNHh6kL2iSXqmEMwrw-txPw@mail.gmail.com>
 <20181108072608.GF12063@builder>
In-Reply-To: <20181108072608.GF12063@builder>
From: xiang xiao <xiaoxiang781216@gmail.com>
Date: Thu, 8 Nov 2018 16:23:59 +0800
Message-ID: <CAH2Cfb9ZsFq=VNn_PyHcXPBXnFb_FjXWefFMSh0v5=p4BRi58Q@mail.gmail.com>
Subject: Re: Regression by commit 7e83cab824a86704cdbd7735c19d34e0ce423dc5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, spjoshi@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Nov 8, 2018 at 3:22 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 07 Nov 22:36 PST 2018, xiang xiao wrote:
>
> > On Thu, Nov 8, 2018 at 2:18 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Wed 07 Nov 06:25 PST 2018, xiang xiao wrote:

> > > > When the crash happen, is it better to destroy and recreate all vir=
tio
> > > > device and it=E2=80=99s children(rpmsg device) again to match the r=
emote side state
> > > > like the original behavior?
> > > >
> > >
> > > Yes, it's likely that the protocols on top does share some state, so =
we
> > > do not have any choice but to report this up to the virtio device.
> > >
> > > Removing and re-probing the devices - rather than having some other f=
orm
> > > of notification of this event - makes the code simpler.
> > >
> > >
> > > But it seems we're trying to re-register the same device the second
> > > time, rather than initialize a new one.
> > >
> > If we use one new here, the old need to be destroyed to avoid the leak.
> > Basically, it's become the old approach again.
> >
>
> You're right, for vdevs we must tear them down and bring them up again.
>
> The reason for introducing the offending commit was for carveouts to
> be allocated past the stop() call, so that we can stop the core and
> provide a coredump for post mortem debugging.
>
Why we need stop the remote core before making a coredump?
Basically, the coredump is just a series memory copy, it isn't harmful
to do it while the remote code is still live.
