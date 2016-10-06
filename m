Return-Path: <emil.l.velikov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161006093721.GA436@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1473081421-16555-1-git-send-email-peter.griffin@linaro.org>
 <1473081421-16555-18-git-send-email-peter.griffin@linaro.org>
 <CACvgo52_g7anGBd9HTUyYsbp5QmQEk9LR3nNHgSTgjQ29G3ViA@mail.gmail.com>
 <20160920083251.GB26093@griffinp-ThinkPad-X1-Carbon-2nd> <8760pqncee.fsf@intel.com>
 <20161006093721.GA436@griffinp-ThinkPad-X1-Carbon-2nd>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 6 Oct 2016 11:45:41 +0100
Message-ID: <CACvgo50vU5_=KFUCAZDaQPepPdsbnF8KN1b+f6KJNuBW6qRdSg@mail.gmail.com>
Subject: Re: [PATCH v9 17/19] drm/virtio: kconfig: Fix recursive dependency issue.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Ohad Ben-Cohen <ohad@wizery.com>, devicetree <devicetree@vger.kernel.org>, kernel@stlinux.com, vinod.koul@intel.com, Lee Jones <lee.jones@linaro.org>, linux-remoteproc@vger.kernel.org, patrice.chotard@st.com, ML dri-devel <dri-devel@lists.freedesktop.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, dmaengine@vger.kernel.org, dan.j.williams@intel.com, Bjorn Andersson <bjorn.andersson@linaro.org>, "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 6 October 2016 at 10:37, Peter Griffin <peter.griffin@linaro.org> wrote:

> In fact the help text for VIRTIO even states this option should be select=
ed
> by any driver which implements virtio.
>
Almost but not quite. It says:

"This option is selected by any driver which implements the virtio _bus_"

REMOTEPROC obviously does that while the ST SLIM driver does not. Thus
the latter should _not_ select, be that explicitly or implicitly via
REMOTEPROC, the symbol.

>>
>> People tend to abuse select because it's "convenient". If you depend,
>> but some of your dependencies aren't met, you're in for some digging
>> through Kconfig to find the missing deps. Just to make the option you
>> want visible in menuconfig. If you instead select something with
>> dependencies, it'll be right most of the time, and it's "convenient",
>> until it breaks. (And hey, it usually breaks for someone else with some
>> other config, so it's still convenient for you.)
>
> I'm sure they do but in this case it is actually the use of 'depends on'
> which has caused the breakage and inconvenience for somebody else and sad=
ly this
> inconvienice is still on-going due to this patch not being applied or get=
ting an
> acked-by from the appropriate maintainers.
>
Surely you're not saying that pre-existing driver following the
documentation, is 'causing breakage' for a new driver {ab,mis}using a
feature ?

This reminds me an old saying: "If the shoe doesn=E2=80=99t fit, it doesn=
=E2=80=99t
mean there is anything wrong with your feet."
You seem to be suggesting the opposite ?

>>
>> Perhaps kconfig should complain about selecting visible symbols and
>> symbols with dependencies.
>
> That sounds like it would be a useful addition.
>
> Is it possible to get this patch applied or an acked-by to avoid further =
delay
> to the fdma series?
>
Please don't apply duct tape, especially where it's _not_ needed.

$ sed -i s/select REMOTEPROC/depends on REMOTEPROC/ drivers/remoteproc/Kcon=
fig

... will resolve things in the right place. The alternative will lead
to random issues in other subsystems.

Regards,
Emil
