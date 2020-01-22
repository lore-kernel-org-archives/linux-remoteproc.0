Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 21 Jan 2020 20:34:54 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv5 01/14] dt-bindings: remoteproc: Add OMAP remoteproc
 bindings
Message-ID: <20200122023454.GA5809@bogus>
References: <20200116135332.7819-1-t-kristo@ti.com>
 <20200116135332.7819-2-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200116135332.7819-2-t-kristo@ti.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org, s-anna@ti.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, 16 Jan 2020 15:53:19 +0200, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> Add the device tree bindings document for the IPU and DSP
> remote processor devices on OMAP4+ SoCs.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Suman Anna <s-anna@ti.com>
> [t-kristo@ti.com: converted to schema]
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
> v5:
>   - enforced ordering of reg-names
>   - removed ti,bootreg-shift, instead added this under ti,bootreg
>     property
>   - renamed ti,autosuspend-delay to ti,autosuspend-delay-ms
>   - fixed required property handling
>   - fixed the omap5 ipu example firmware name extension
>   
>  .../remoteproc/ti,omap-remoteproc.yaml        | 322 ++++++++++++++++++
>  1 file changed, 322 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
