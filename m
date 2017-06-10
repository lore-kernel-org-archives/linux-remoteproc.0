Return-Path: <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH v2 2/3] remoteproc/keystone: Add a remoteproc driver for
 Keystone 2 DSPs
References: <20170608002447.47580-1-s-anna@ti.com>
 <20170608002447.47580-3-s-anna@ti.com>
From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Message-ID: <a8bc0ae1-5583-8622-fe01-406e77f25bc4@oracle.com>
Date: Sat, 10 Jun 2017 12:32:18 -0700
MIME-Version: 1.0
In-Reply-To: <20170608002447.47580-3-s-anna@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Suman Anna <s-anna@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, Sam Nelson <sam.nelson@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

6/7/2017 5:24 PM, Suman Anna wrote:
> The Texas Instrument's Keystone 2 family of SoCs has 1 or more
> TMS320C66x DSP Core Subsystems (C66x CorePacs). Each subsystem has
> a C66x Fixed/Floating-Point DSP Core, with 32KB of L1P and L1D SRAMs,
> that can be configured and partitioned as either RAM and/or Cache,
> and 1 MB of L2 SRAM. The CorePac also includes an Internal DMA (IDMA),
> External Memory Controller (EMC), Extended Memory Controller (XMC)
> with a Memory Protection and Address Extension (MPAX) unit, a Bandwidth
> Management (BWM) unit, an Interrupt Controller (INTC) and a Powerdown
> Controller (PDC).
> 
> A new remoteproc module is added to perform the device management of
> these DSP devices. The driver expects the firmware names to be of the
> form "keystone-dsp<X>-fw", where X is the corresponding DSP number, and
> uses the standard remoteproc core ELF loader. The support is limited
> to images only using the DSP internal memories at the moment. This
> remoteproc driver is also designed to work with virtio, and uses the
> IPC Generation registers for performing the virtio signalling and
> getting notified of exceptions.
> 
> The driver currently supports the 66AK2H/66AK2K, 66AK2L and 66AK2E
> SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---

Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
