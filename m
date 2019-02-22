Return-Path: <xiaoxiang781216@gmail.com>
MIME-Version: 1.0
References: <20190213220734.10471-1-pierre-louis.bossart@linux.intel.com>
 <1550520188-9253-1-git-send-email-xiaoxiang@xiaomi.com> <2ad7bf66-a0a9-b97d-e1b1-48e3f9c699c5@linaro.org>
 <CAH2Cfb8XZTD1a+2vm2W7mB8Bfyb1v-ArCw8rf0+TjXGPK0msKg@mail.gmail.com>
 <a499dec8-ed61-dd9a-77dc-e60225f79e46@linux.intel.com> <20190221043925.GF2736@vkoul-mobl>
 <7a67b767-5127-1844-20c5-06ef5946e85d@linux.intel.com> <CAH2Cfb9EM0DqFSpJqFggWdg+VhCtXNXq5EXz1HM+xrTA8G5oJQ@mail.gmail.com>
 <b8608e5b-b342-5fed-7715-38a906b5a43d@linux.intel.com>
In-Reply-To: <b8608e5b-b342-5fed-7715-38a906b5a43d@linux.intel.com>
From: xiang xiao <xiaoxiang781216@gmail.com>
Date: Sat, 23 Feb 2019 02:21:40 +0800
Message-ID: <CAH2Cfb-efq1U_r5jgvef-PQDg3+oZg2TofLXh=S03pyaqjVcPQ@mail.gmail.com>
Subject: Re: [alsa-devel] [v4,00/14] ASoC: Sound Open Firmware (SOF) core
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Keyon Jie <yang.jie@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Daniel Baluta <daniel.baluta@gmail.com>, Kumar Gala <kumar.gala@linaro.org>, andriy.shevchenko@intel.com, tiwai@suse.de, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>, liam.r.girdwood@linux.intel.com, Vinod Koul <vkoul@kernel.org>, broonie@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Xiang Xiao <xiaoxiang@xiaomi.com>, Alan Cox <alan@linux.intel.com>, wendy.liang@xilinx.com, sound-open-firmware@alsa-project.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Feb 22, 2019 at 7:13 PM Keyon Jie <yang.jie@linux.intel.com> wrote:
>
>
>
> On 2019/2/22 =E4=B8=8B=E5=8D=884:32, xiang xiao wrote:
> > On Thu, Feb 21, 2019 at 11:27 PM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> wrote:
> >>
> >>
> >> Should we utilize official IPC frameowrk instead reinverting the wheel=
?
> >> 1.Load firmware by drivers/remoteproc
> >>      https://www.kernel.org/doc/Documentation/remoteproc.txt
> >> 2.Do the comunication through drivers/rpmsg
> >>      https://www.kernel.org/doc/Documentation/rpmsg.txt
> >> Many vendor(TI, Qualcomm, ST, NXP, Xilinx...) migrate to remoteproc/rp=
msg, why Intel provide an other IPC mechanism?
> >>
> >> It definitely makes more sense to use rpmsg for Generic IPC driver her=
e.
> >>
> >> Qualcomm DSP audio drivers (non SOF) already use rpmsg. This will
> >> definitely help everyone in future while immigrating to SOF.
> >>
> >> Actually, Xiaomi also build DSP audio driver on top of rpmsg, but
> >> fully integrate with the ASoC topology framework, and the firmware is
> >> base on FreeRTOS and OpenMAX.
> >> SOF initiative is very good and exciting, our team members(include me)
> >> spend a couple weeks to study the current code base on both firmware
> >> and kernel side, we even port SOF to our DSP/MCU and make it run, but
> >> I have to point out that:
> >> SOF IPC is too simple and rigid, tightly couple with Intel platform
> >> and audio domain, which make:
> >>      a.It's difficult to integrate with other vendor SoC, especially i=
f
> >> other vendor already adopt remote/rpmsg(this is already a trend!).
> >>      b.It's difficult to add other IPC services for example:
> >>         i.Audio DSP talk to power MCU to adjust clock and voltage
> >>         ii.Export ultrasonic distance measurement to IIO subsystem
> >>
> >> The IPC scheme suggested in this patchset is only a first pass that wo=
rks on
> >> 3 generations on Intel platforms + the QEMU  parts. There are no claim=
s that
> >> the current solution is set-in-stone, and this is already an area wher=
e
> >> things are already changing to support notifications and low-power
> >> transitions.
> >>
> >> There will clearly be evolutions to make the IPC more flexible/generic=
, but
> >> we've got to start somewhere and bear in mind that we also have to sup=
port
> >> memory-constrained legacy devices where such generic frameworks aren't
> >> needed or even implementable. Some of your proposals such as changing
> >> power/clocks with a firmware request aren't necessarily possible or
> >> recommended on all platforms - i can already hear security folks howli=
ng,
> >> this was already mentioned in the GitHub thread.
> >>
> >> Rather than evolve the IPC, i would say it makes more sense that we
> >> "reuse" existing upstream frameworks.. As given below by xiang
> >> this seems to have support for RTOSes (see point 4 below) and looking =
at
> >> below it seems to have much better coverage across systems.
> >>
> >> This should also help in easy adoption of SoF for non Intel people...
> >>
> >> Also looking at it, lot of IPC code, DSP loading etc would go away
> >> making SoF code lesser in footprint.
> >>
> >> I think benefits outweigh the effort of porting to a framework which i=
s
> >> already upstream and used on many platforms for different vendors!
> >>
> >> There is no free lunch. There are 'features' of RPMsg which aren't nec=
essarily great for all platforms, e.g. the concepts of virtio-like rings fo=
r IPC with available/used buffers for both directions are not a good match =
or replacement for the memory-window-based IPC on Intel platforms, where th=
ere is no DDR access, a small window allocated by firmware and only a coupl=
e of doorbell registers for essentially serial communication.
> >
> > rpmsg support to define the custom mechanism(see rpmsg_endpoint_ops in
> > drivers\rpmsg\rpmsg_internal.h) but keep the upper layer API, qcomm
> > utilize this for glink and smd actually.
>
> Then this looks doable, thanks for sharing Xiang.
>
> I have several questions:
> 1. Is virtio device and vring buffer access support in remote proc(Audio
> DSP in our case) side mandatory? Which means we have to porting
> libraries like libAMP into FW(not uses Zephyr or freeRTOS yet)?

If you go through viritio/rpmsg path, virtio/vring are required,
but if you implement the new rpmsg_endpoint_ops, both shouldn't be needed.
But both OpenAMP/RPMsg-Lite support the bare metal environment,
actually since both library define the clean and thin port layer, it's
very easy to port(I just spend 2-3 days for NuttX port).

> 2. About the resource table in FW binary, is this mandatory or it could
> be empty?

Again virtio/rpmsg path is required, but custom implementation mayn't neede=
d.
Actually, remoteproc layer support the custom firmware format, so SOF
can migrate to remoteproc without changing firmware format.

>
> As you may know, we uses SOF-similar IPC framework(which is quite
> different with rpmsg/remoteproc) on Intel SoC platforms for long on tens
> of platforms of several generations(we have enabled and verified SOF on
> most of them), so the transition may take time.
>

Yes, I understand. But Intel still could provide the current version
to the customer before the new IPC version is stable if many people
think the generic IPC is the good direction to go.

> Thanks,
> ~Keyon
>
> >
> >> The resources embedded in a firmware file is another capability that d=
oesn't align with the way the SOF firmware is generated. I also don't know =
where the topology file would be handled, nor how to deal with suspend-resu=
me where the DSP needs to be restarted. For folks who need an introduction =
to RPMsg, the link [1] is the best I found to scope out the work required.
> >>
> >
> > We can share our rpmsg based topology implementation as reference which=
:
> > 1.About 2500 lines(much less than SOF)
> > 2.Support pcm and compress playback/capture
> > 3.No any vendor dependence(thanks for rpmsg/remoteproc)
> >
> >> In short, I don't mind looking at RPMsg as an option and would welcome=
 contributions, but making it the default raises a number of technical chal=
lenges that can't be dismissed just yet, and such a transition isn't going =
to happen overnight. There are other evolutions that were mentioned as well=
, such as using the MFD framework to split the driver in 'core/hardware' su=
pport and application-specific parts (audio, sensors, etc), and likewise we=
 need time to make it happen - just like we need time to move to the modern=
 dailinks, add multi-cpu and SoundWire support, add digital domains, etc.
> >>
> >
> >> [1] http://processors.wiki.ti.com/index.php/PRU-ICSS_Remoteproc_and_RP=
Msg
> >>
> >>
> > _______________________________________________
> > Alsa-devel mailing list
> > Alsa-devel@alsa-project.org
> > https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> >
