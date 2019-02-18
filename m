Return-Path: <xiaoxiang781216@gmail.com>
Return-Path: <xiaoxiang781216@gmail.com>
From: Xiang Xiao <xiaoxiang781216@gmail.com>
Subject: Re: [v4,00/14] ASoC: Sound Open Firmware (SOF) core
Date: Tue, 19 Feb 2019 04:03:08 +0800
Message-Id: <1550520188-9253-1-git-send-email-xiaoxiang@xiaomi.com>
In-Reply-To: <20190213220734.10471-1-pierre-louis.bossart@linux.intel.com>
References: <20190213220734.10471-1-pierre-louis.bossart@linux.intel.com>
To: Daniel Baluta <daniel.baluta@gmail.com>, andriy.shevchenko@intel.com, tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org, Alan Cox <alan@linux.intel.com>, sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>, wendy.liang@xilinx.com, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Kumar Gala <kumar.gala@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Should we utilize official IPC frameowrk instead reinverting the wheel?
1.Load firmware by drivers/remoteproc
  https://www.kernel.org/doc/Documentation/remoteproc.txt
2.Do the comunication through drivers/rpmsg
  https://www.kernel.org/doc/Documentation/rpmsg.txt
Many vendor(TI, Qualcomm, ST, NXP, Xilinx...) migrate to remoteproc/rpmsg, why Intel provide an other IPC mechanism?
Actually, remoteproc/rpmsg is much better than SOF IPC because:
1.Completely isolate the firmware load and message transfer:
  The same rpmsg driver could run on any remote processor
2.Separate the application protocol from transfer layer:
  One remote processor could host many rpmsg services
3.Completely follow kernel driver model(rpsmg_bus, rpmsg_device and rpmsg_driver).
4.Support by many RTOS(Bare Metal, FreeRTOS, Zephyr, NuttX, Nucleus, uC/OS...) for remote side:
  https://github.com/OpenAMP/open-amp
  https://github.com/NXPmicro/rpmsg-lite
5.Maintained by the standard committee:
  https://www.multicore-association.org/workgroup/oamp.php
  https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=virtio
Since the keypoint of SOF is the platform agnostic and modular, please use the standard technique here.

Thanks
Xiang
