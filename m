Return-Path: <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH v2 3/3] remoteproc/keystone: Ensure the DSPs are in reset
 in probe
References: <20170608002447.47580-1-s-anna@ti.com>
 <20170608002447.47580-4-s-anna@ti.com>
From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Message-ID: <6ce5952b-55b0-8f77-2e14-51110d6bf979@oracle.com>
Date: Sat, 10 Jun 2017 12:32:43 -0700
MIME-Version: 1.0
In-Reply-To: <20170608002447.47580-4-s-anna@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Suman Anna <s-anna@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, Sam Nelson <sam.nelson@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 6/7/2017 5:24 PM, Suman Anna wrote:
> From: "Andrew F. Davis" <afd@ti.com>
> 
> The DSPs are expected to be in reset when the driver probes a device.
> If the DSPs are out of reset in probe, the system may crash when the
> firmware is being loaded. So, add a check to make sure the DSP resets
> are asserted, and if not, throw a eye-catchy warning and assert the
> resets specifically.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> [s-anna@ti.com: replace warning with a WARN]
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
