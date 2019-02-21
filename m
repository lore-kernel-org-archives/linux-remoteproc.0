Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [alsa-devel] [v4,00/14] ASoC: Sound Open Firmware (SOF) core
References: <20190213220734.10471-1-pierre-louis.bossart@linux.intel.com>
 <1550520188-9253-1-git-send-email-xiaoxiang@xiaomi.com>
 <2ad7bf66-a0a9-b97d-e1b1-48e3f9c699c5@linaro.org>
 <CAH2Cfb8XZTD1a+2vm2W7mB8Bfyb1v-ArCw8rf0+TjXGPK0msKg@mail.gmail.com>
 <a499dec8-ed61-dd9a-77dc-e60225f79e46@linux.intel.com>
 <20190221043925.GF2736@vkoul-mobl>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <1af21f7e-1ea1-98a0-cf6d-74d0f4e5b186@st.com>
Date: Thu, 21 Feb 2019 11:42:25 +0100
MIME-Version: 1.0
In-Reply-To: <20190221043925.GF2736@vkoul-mobl>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Vinod Koul <vkoul@kernel.org>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: xiang xiao <xiaoxiang781216@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Daniel Baluta <daniel.baluta@gmail.com>, Kumar Gala <kumar.gala@linaro.org>, "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "tiwai@suse.de" <tiwai@suse.de>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>, Xiang Xiao <xiaoxiang@xiaomi.com>, "sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>, "wendy.liang@xilinx.com" <wendy.liang@xilinx.com>, Alan Cox <alan@linux.intel.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hello,

On 2/21/19 5:39 AM, Vinod Koul wrote:
> Hi Pierre,
> 
> On 19-02-19, 09:55, Pierre-Louis Bossart wrote:
>> 
>> On 2/19/19 9:09 AM, xiang xiao wrote:
>> > On Tue, Feb 19, 2019 at 5:49 PM Srinivas Kandagatla
>> > <srinivas.kandagatla@linaro.org> wrote:
>> > > 
>> > > 
>> > > On 18/02/2019 20:03, Xiang Xiao wrote:
>> > > > Should we utilize official IPC frameowrk instead reinverting the wheel?
>> > > > 1.Load firmware by drivers/remoteproc
>> > > >     https://www.kernel.org/doc/Documentation/remoteproc.txt
>> > > > 2.Do the comunication through drivers/rpmsg
>> > > >     https://www.kernel.org/doc/Documentation/rpmsg.txt
>> > > > Many vendor(TI, Qualcomm, ST, NXP, Xilinx...) migrate to remoteproc/rpmsg, why Intel provide an other IPC mechanism?
>> > > It definitely makes more sense to use rpmsg for Generic IPC driver here.
>> > > 
>> > > Qualcomm DSP audio drivers (non SOF) already use rpmsg. This will
>> > > definitely help everyone in future while immigrating to SOF.
>> > > 
>> > Actually, Xiaomi also build DSP audio driver on top of rpmsg, but
>> > fully integrate with the ASoC topology framework, and the firmware is
>> > base on FreeRTOS and OpenMAX.
>> > SOF initiative is very good and exciting, our team members(include me)
>> > spend a couple weeks to study the current code base on both firmware
>> > and kernel side, we even port SOF to our DSP/MCU and make it run, but
>> > I have to point out that:
>> > SOF IPC is too simple and rigid, tightly couple with Intel platform
>> > and audio domain, which make:
>> >     a.It's difficult to integrate with other vendor SoC, especially if
>> > other vendor already adopt remote/rpmsg(this is already a trend!).
>> >     b.It's difficult to add other IPC services for example:
>> >        i.Audio DSP talk to power MCU to adjust clock and voltage
>> >        ii.Export ultrasonic distance measurement to IIO subsystem
>> 
>> The IPC scheme suggested in this patchset is only a first pass that works on
>> 3 generations on Intel platforms + the QEMU  parts. There are no claims that
>> the current solution is set-in-stone, and this is already an area where
>> things are already changing to support notifications and low-power
>> transitions.
>> 
>> There will clearly be evolutions to make the IPC more flexible/generic, but
>> we've got to start somewhere and bear in mind that we also have to support
>> memory-constrained legacy devices where such generic frameworks aren't
>> needed or even implementable. Some of your proposals such as changing
>> power/clocks with a firmware request aren't necessarily possible or
>> recommended on all platforms - i can already hear security folks howling,
>> this was already mentioned in the GitHub thread.
> 
> Rather than evolve the IPC, i would say it makes more sense that we
> "reuse" existing upstream frameworks.. As given below by xiang
> this seems to have support for RTOSes (see point 4 below) and looking at
> below it seems to have much better coverage across systems.
> 
> This should also help in easy adoption of SoF for non Intel people...
> 
> Also looking at it, lot of IPC code, DSP loading etc would go away
> making SoF code lesser in footprint.
> 
> I think benefits outweigh the effort of porting to a framework which is
> already upstream and used on many platforms for different vendors!

Just for information... ST Microelectronics plans to port SOF to at
least one of its platforms (based on ARM cores). Today, for the
co-processor  management we use the rpmsg and remoteproc frameworks on
the Linux kernel side and OpenAMP on the remote processor side. We are
therefore interested in xiang's work.
An advantage we see in this generic solution is that compatibility
between the Linux kernel frameworks and the OpenAMP library is ensured
through discussions in the Linux and OpenAMP communities, involving
maintainers and several vendors.

Regards
Arnaud

> 
>> There are other paths such as using the mailbox framework, and at the end of
>> the day the IPC is likely going to be a configurable element where
>> integrators pick what's best for them. If you strongly believe that the
>> RPMSG framework is the way to go, there is a public github and you can
>> contribute the relevant changes with both kernel and firmware patches.
>> 
>> > 
>> > > > Actually, remoteproc/rpmsg is much better than SOF IPC because:
>> > > > 1.Completely isolate the firmware load and message transfer:
>> > > >     The same rpmsg driver could run on any remote processor
>> > > > 2.Separate the application protocol from transfer layer:
>> > > >     One remote processor could host many rpmsg services
>> > > > 3.Completely follow kernel driver model(rpsmg_bus, rpmsg_device and rpmsg_driver).
>> > > > 4.Support by many RTOS(Bare Metal, FreeRTOS, Zephyr, NuttX, Nucleus, uC/OS...) for remote side:
>> > > >     https://github.com/OpenAMP/open-amp
>> > > >     https://github.com/NXPmicro/rpmsg-lite
> 
> ^^^
> 
>> > > > 5.Maintained by the standard committee:
>> > > >     https://www.multicore-association.org/workgroup/oamp.php
>> > > >     https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=virtio
>> > > > Since the keypoint of SOF is the platform agnostic and modular, please use the standard technique here.
>> 
>> As stated above there is no opposition to using fancier/more generic IPC
>> solutions, but they have to be considered as evolutions and follow the due
>> process of contributions/reviews plus be aligned with product timelines.
> 
> Sorry but upstream cares more about doing the right things rather than
> vendor timelines..
> 
> -- 
> ~Vinod
