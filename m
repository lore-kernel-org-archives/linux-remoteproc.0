Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 14 Oct 2019 12:16:44 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: hwlock: Convert stm32 hwspinlock
 bindings to json-schema
Message-ID: <20191014171644.GA4140@bogus>
References: <20191014091756.23763-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014091756.23763-1-benjamin.gaignard@st.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, 14 Oct 2019 11:17:56 +0200, Benjamin Gaignard wrote:
> Convert the STM32 hwspinlock binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> change in v3:
> - use (GPL-2.0-only OR BSD-2-Clause)
> 
> change in v2:
> - use BSD-2-Clause license
> - use const for #hwlock-cells
> - add additionalProperties: false
> 
>  .../bindings/hwlock/st,stm32-hwspinlock.txt        | 23 ----------
>  .../bindings/hwlock/st,stm32-hwspinlock.yaml       | 50 ++++++++++++++++++++++
>  2 files changed, 50 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
>  create mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
> 

Applied, thanks.

Rob
