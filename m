Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 31 Mar 2020 15:56:52 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: k3-dsp: Update bindings for
 C71x DSPs
Message-ID: <20200331215652.GA10923@bogus>
References: <20200325204701.16862-1-s-anna@ti.com>
 <20200325204701.16862-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325204701.16862-2-s-anna@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Clement Leger <cleger@kalray.eu>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Lokesh Vutla <lokeshvutla@ti.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, 25 Mar 2020 15:46:58 -0500, Suman Anna wrote:
> Some Texas Instruments K3 family of SoCs have one of more newer
> generation TMS320C71x CorePac processor subsystem in addition to
> the existing TMS320C66x CorePac processor subsystems. Update the
> device tree bindings document for the C71x DSP devices.
> 
> The example is also updated to show the single C71 DSP present
> on J721E SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  .../bindings/remoteproc/ti,k3-dsp-rproc.yaml  | 78 ++++++++++++++++---
>  1 file changed, 69 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
