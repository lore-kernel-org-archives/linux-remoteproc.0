Return-Path: <michals@xilinx.com>
Return-Path: michal.simek@xilinx.com
Subject: Re: [PATCH v3 0/5] remoteproc: Add zynqmp_r5 driver
References: <1587421629-914-1-git-send-email-ben.levinsky@xilinx.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <85e3cc84-47b7-dc33-0c6a-64638315ab26@xilinx.com>
Date: Tue, 21 Apr 2020 07:57:25 +0200
MIME-Version: 1.0
In-Reply-To: <1587421629-914-1-git-send-email-ben.levinsky@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Ben Levinsky <ben.levinsky@xilinx.com>, ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 21. 04. 20 0:27, Ben Levinsky wrote:
> There are Cortex-R5 processors on Xilinx ZynqMP UltraScale+
> MPSoC.
> This patch is to add an Xilinx ZynqMP R5 remoteproc driver to
> enable Linux kernel to bringup R5, and enable communication
> between Linux kernel and R5.
> 
> There are Cortex-R5 processors on the Xilinx ZynqMP UltraScale+ MPSoC.
> This patch adds a Xilinx ZynqMP R5 remoteproc driver to enable the
> Linux kernel to bring up the R5s, and to enable communication
> between the Linux kernel and R5s.
> 

This is based on any code which is not upstream. It means you need to
say what it is your base here.

Thanks,
Michal
