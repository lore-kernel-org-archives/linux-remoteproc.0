Return-Path: <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: Add Keystone DSP
 remoteproc binding
References: <20170608002447.47580-1-s-anna@ti.com>
 <20170608002447.47580-2-s-anna@ti.com>
From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Message-ID: <3a4d0c88-6077-1c59-8559-d3db3de914f4@oracle.com>
Date: Sat, 10 Jun 2017 12:33:38 -0700
MIME-Version: 1.0
In-Reply-To: <20170608002447.47580-2-s-anna@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Suman Anna <s-anna@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, Sam Nelson <sam.nelson@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 6/7/2017 5:24 PM, Suman Anna wrote:
> Add the device tree bindings document for the Texas Instrument's
> Keystone 2 DSP remoteproc devices.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
> v2 Changes:
>   - Modified the patch title
>   - Dropped unstable binding status
>   - Dropped the 'label' property and replaced the device node description
>     to use an alias
>   - Renamed 'kick-gpio' to 'kick-gpios'
>   - Updated the example

Looks reasonable to me. Ofcourse you need Rob's ack for this one.

Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
