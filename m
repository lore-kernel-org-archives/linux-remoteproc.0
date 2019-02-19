Return-Path: <xiaoxiang781216@gmail.com>
MIME-Version: 1.0
References: <20190213220734.10471-1-pierre-louis.bossart@linux.intel.com>
 <1550520188-9253-1-git-send-email-xiaoxiang@xiaomi.com> <2ad7bf66-a0a9-b97d-e1b1-48e3f9c699c5@linaro.org>
In-Reply-To: <2ad7bf66-a0a9-b97d-e1b1-48e3f9c699c5@linaro.org>
From: xiang xiao <xiaoxiang781216@gmail.com>
Date: Tue, 19 Feb 2019 23:09:40 +0800
Message-ID: <CAH2Cfb8XZTD1a+2vm2W7mB8Bfyb1v-ArCw8rf0+TjXGPK0msKg@mail.gmail.com>
Subject: Re: [alsa-devel] [v4,00/14] ASoC: Sound Open Firmware (SOF) core
Content-Type: text/plain; charset="UTF-8"
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Daniel Baluta <daniel.baluta@gmail.com>, andriy.shevchenko@intel.com, tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org, Alan Cox <alan@linux.intel.com>, sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>, wendy.liang@xilinx.com, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Kumar Gala <kumar.gala@linaro.org>, linux-remoteproc@vger.kernel.org, Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Feb 19, 2019 at 5:49 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 18/02/2019 20:03, Xiang Xiao wrote:
> > Should we utilize official IPC frameowrk instead reinverting the wheel?
> > 1.Load firmware by drivers/remoteproc
> >    https://www.kernel.org/doc/Documentation/remoteproc.txt
> > 2.Do the comunication through drivers/rpmsg
> >    https://www.kernel.org/doc/Documentation/rpmsg.txt
> > Many vendor(TI, Qualcomm, ST, NXP, Xilinx...) migrate to remoteproc/rpmsg, why Intel provide an other IPC mechanism?
>
> It definitely makes more sense to use rpmsg for Generic IPC driver here.
>
> Qualcomm DSP audio drivers (non SOF) already use rpmsg. This will
> definitely help everyone in future while immigrating to SOF.
>

Actually, Xiaomi also build DSP audio driver on top of rpmsg, but
fully integrate with the ASoC topology framework, and the firmware is
base on FreeRTOS and OpenMAX.
SOF initiative is very good and exciting, our team members(include me)
spend a couple weeks to study the current code base on both firmware
and kernel side, we even port SOF to our DSP/MCU and make it run, but
I have to point out that:
SOF IPC is too simple and rigid, tightly couple with Intel platform
and audio domain, which make:
   a.It's difficult to integrate with other vendor SoC, especially if
other vendor already adopt remote/rpmsg(this is already a trend!).
   b.It's difficult to add other IPC services for example:
      i.Audio DSP talk to power MCU to adjust clock and voltage
      ii.Export ultrasonic distance measurement to IIO subsystem

> > Actually, remoteproc/rpmsg is much better than SOF IPC because:
> > 1.Completely isolate the firmware load and message transfer:
> >    The same rpmsg driver could run on any remote processor
> > 2.Separate the application protocol from transfer layer:
> >    One remote processor could host many rpmsg services
> > 3.Completely follow kernel driver model(rpsmg_bus, rpmsg_device and rpmsg_driver).
> > 4.Support by many RTOS(Bare Metal, FreeRTOS, Zephyr, NuttX, Nucleus, uC/OS...) for remote side:
> >    https://github.com/OpenAMP/open-amp
> >    https://github.com/NXPmicro/rpmsg-lite
> > 5.Maintained by the standard committee:
> >    https://www.multicore-association.org/workgroup/oamp.php
> >    https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=virtio
> > Since the keypoint of SOF is the platform agnostic and modular, please use the standard technique here.
> >
> > Thanks
> > Xiang
> > _______________________________________________
> > Alsa-devel mailing list
> > Alsa-devel@alsa-project.org
> > http://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> >
> --srini
