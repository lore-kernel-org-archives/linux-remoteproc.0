Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Thu, 10 Aug 2017 09:01:57 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: remoteproc: Add bindings for Davinci
 DSP processors
Message-ID: <20170810140157.osn5rtymykgdf6gp@rob-hp-laptop>
References: <20170801154844.24662-1-s-anna@ti.com>
 <20170801154844.24662-4-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170801154844.24662-4-s-anna@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, Robert Tivy <rtivy@ti.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Aug 01, 2017 at 10:48:43AM -0500, Suman Anna wrote:
> Add the device tree bindings document for the DSP processor
> subsystem devices on TI Davinci DA8xx/OMAP-L13x SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v2: 
>  - Updated the patch header
>  - Revised the binding status statement slightly
>  - Updated the example to address Rob's comments
>  - No changes in properties description themselves
> v1: https://patchwork.kernel.org/patch/9751269/
> 
>  .../bindings/remoteproc/ti,davinci-rproc.txt       | 86 ++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,davinci-rproc.txt

Acked-by: Rob Herring <robh@kernel.org>
