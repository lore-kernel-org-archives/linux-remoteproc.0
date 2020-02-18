Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 18 Feb 2020 15:00:07 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 3/3] dt-bindings: remoteproc: stm32: add syscon
 bindings preloaded fw support
Message-ID: <20200218210007.GA27448@bogus>
References: <20200211174205.22247-1-arnaud.pouliquen@st.com>
 <20200211174205.22247-4-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211174205.22247-4-arnaud.pouliquen@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Loic PALLARDY <loic.pallardy@st.com>, Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, 11 Feb 2020 18:42:05 +0100, Arnaud Pouliquen wrote:
> Add the optional syscon property that points to the resource table
> address and the state of the Cortex-M4 firmware loaded by the bootloader.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
