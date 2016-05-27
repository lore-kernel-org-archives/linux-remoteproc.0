Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 27 May 2016 10:44:57 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 04/18] dmaengine: st_fdma: Add STMicroelectronics FDMA
 DT binding documentation
Message-ID: <20160527154457.GA20370@rob-hp-laptop>
References: <1464192412-16386-1-git-send-email-peter.griffin@linaro.org>
 <1464192412-16386-6-git-send-email-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1464192412-16386-6-git-send-email-peter.griffin@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com, ohad@wizery.com, bjorn.andersson@linaro.org, arnd@arndb.de, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, dmaengine@vger.kernel.org, lee.jones@linaro.org, Ludovic Barre <ludovic.barre@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, May 25, 2016 at 05:06:38PM +0100, Peter Griffin wrote:
> This patch adds the DT binding documentation for the FDMA constroller
> found on STi based chipsets from STMicroelectronics.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  Documentation/devicetree/bindings/dma/st_fdma.txt | 87 +++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/st_fdma.txt

Acked-by: Rob Herring <robh@kernel.org>
