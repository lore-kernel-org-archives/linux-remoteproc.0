Return-Path: <xiaoxiang781216@gmail.com>
MIME-Version: 1.0
References: <20190213220734.10471-1-pierre-louis.bossart@linux.intel.com>
 <1550520188-9253-1-git-send-email-xiaoxiang@xiaomi.com> <2ad7bf66-a0a9-b97d-e1b1-48e3f9c699c5@linaro.org>
 <CAH2Cfb8XZTD1a+2vm2W7mB8Bfyb1v-ArCw8rf0+TjXGPK0msKg@mail.gmail.com>
 <a499dec8-ed61-dd9a-77dc-e60225f79e46@linux.intel.com> <20190221043925.GF2736@vkoul-mobl>
 <7a67b767-5127-1844-20c5-06ef5946e85d@linux.intel.com> <CAH2Cfb9EM0DqFSpJqFggWdg+VhCtXNXq5EXz1HM+xrTA8G5oJQ@mail.gmail.com>
 <750e7de7-eb2c-81f3-32f0-420c89e7b34b@linux.intel.com> <CAH2Cfb9Ubbt1c4TVD8CLFPhxNW8vCCKkPhX96qpYyiV2jCi04w@mail.gmail.com>
 <47956eb2-c4a5-bd73-12ce-f5ddfa5d108a@linux.intel.com>
In-Reply-To: <47956eb2-c4a5-bd73-12ce-f5ddfa5d108a@linux.intel.com>
From: xiang xiao <xiaoxiang781216@gmail.com>
Date: Sun, 24 Feb 2019 00:42:38 +0800
Message-ID: <CAH2Cfb9QC-uZEXj-ecMRbThUZ3kwwLqy-yb2xhKDvfOwNUnKxg@mail.gmail.com>
Subject: Re: [alsa-devel] [Sound-open-firmware] [v4, 00/14] ASoC: Sound Open
 Firmware (SOF) core
Content-Type: text/plain; charset="UTF-8"
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Daniel Baluta <daniel.baluta@gmail.com>, Kumar Gala <kumar.gala@linaro.org>, andriy.shevchenko@intel.com, tiwai@suse.de, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>, liam.r.girdwood@linux.intel.com, Vinod Koul <vkoul@kernel.org>, broonie@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Xiang Xiao <xiaoxiang@xiaomi.com>, Alan Cox <alan@linux.intel.com>, wendy.liang@xilinx.com, sound-open-firmware@alsa-project.org, =?UTF-8?B?5a6J6LaF?= <anchao@pinecone.net>, =?UTF-8?B?5p2O5qGC5LiB?= <liguiding@pinecone.net>, zhongan@pinecone.net
List-ID: <linux-remoteproc@vger.kernel.org>

On Sat, Feb 23, 2019 at 5:52 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> >>> We can share our rpmsg based topology implementation as reference which:
> >>> 1.About 2500 lines(much less than SOF)
> >>> 2.Support pcm and compress playback/capture
> >>> 3.No any vendor dependence(thanks for rpmsg/remoteproc)
> >> Sure. Where's the code? What's the license?
> >>
> > The code is base on 4.19 kernel, I could upstream the code basing on
> > the latest kernel in the next couple days for reference.
> > the license is GPL, of course.
> I'll be looking forward to the code. My turn to provide comments :-)
> >
> >> Most of the SOF code is really in hardware-specific .ops callbacks and
> >> topology handling, the generic IPC layer is only ~800 lines of code.
> >> rpmsg would allow for easier portability but a significant reduction of
> >> the code size is unlikely.
> >>
> > The reduce come from:
> > 1.Move firmware load and dsp start/stop to remoteproc layer.
> > 2.Move IPC buffer/mailbox to rpmsg layer.
>
> You are not going to see a lot of code reduction here, at the end of the
> day most of the code comes from hardware-specific register access...
>
> > 3.Reuse ASoC topology parser to generate the audio graph.
> > 4.Reuse ASoC DAMP to control the graph node state change(run/stop/pause/resume).
> > 5.Use the general machine driver glue all individual components
> the last 3 points are already how SOF works, wondering if there is a
> misunderstanding... We are using topology/DAPM directly without any
> reinvention or duplication, as measured by the multiple fixes we
> provided to the frameworks in the last few weeks. Also when
> dedicated/custom topology tokens are needed, you still need code to deal
> with them and send the relevant configuration to firmware, whatever the
> transport format might be.

Here is the patch(~2800 lines) just for reference only:
https://github.com/xiaoxiang781216/linux/commit/077aad71ef153212ddb25cba71082d3ecd684f02

I attach a presentation in the commit to help understand the whole picture:
1.There is a tplg rpmsg driver for each machine:
   a.DSP create a rpmsg channel named "rpmsg-audio"
   b.rpmsg subsystem create a new rpmsg device and bind to tplg rpmsg driver
   c.tplg rpmsg probe callback load the topology file from user space
   d.Forward widget create and route to DSP for graph generation
   e.Forward kcontrol get/set to DSP for widget parameter operation
   Note: widget name is used to locate the widget in DSP.
2.For each FE/BE/COMPR, a new rpmsg based platform driver is created:
   a.Each platform driver create a new rpmsg channel to talk with the
remote peer
   b.Forward snd_pcm_ops/snd_compr_ops to the remote peer
   Note: widget name is used here as the channel name
Basically, 1(TPLG)+n(FE/BE/COMPR) rpmsg channels exist.
