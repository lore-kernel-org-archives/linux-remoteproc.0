Return-Path: <vinod.koul@intel.com>
Date: Mon, 6 Jun 2016 10:06:19 +0530
From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v4 05/18] dmaengine: st_fdma: Add STMicroelectronics FDMA
 driver header file
Message-ID: <20160606043618.GV16910@localhost>
References: <1464192412-16386-1-git-send-email-peter.griffin@linaro.org>
 <1464192412-16386-7-git-send-email-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1464192412-16386-7-git-send-email-peter.griffin@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, ohad@wizery.com, bjorn.andersson@linaro.org, arnd@arndb.de, lee.jones@linaro.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-remoteproc@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, May 25, 2016 at 05:06:39PM +0100, Peter Griffin wrote:

> +/*
> + * request control bits
> + */
> +#define REQ_CTRL_NUM_OPS_MASK		GENMASK(31, 24)
> +#define REQ_CTRL_NUM_OPS(n)		(REQ_CTRL_NUM_OPS_MASK & ((n) << 24))
> +#define REQ_CTRL_INITIATOR_MASK		BIT(22)
> +#define	REQ_CTRL_INIT0			(0x0 << 22)
> +#define	REQ_CTRL_INIT1			(0x1 << 22)

pls keep spaces or tabs, not both :(

> +#define REQ_CTRL_INC_ADDR_ON		BIT(21)
> +#define REQ_CTRL_DATA_SWAP_ON		BIT(17)
> +#define REQ_CTRL_WNR			BIT(14)
> +#define REQ_CTRL_OPCODE_MASK		GENMASK(7, 4)
> +#define REQ_CTRL_OPCODE_LD_ST1		(0x0 << 4)
> +#define REQ_CTRL_OPCODE_LD_ST2		(0x1 << 4)
> +#define REQ_CTRL_OPCODE_LD_ST4		(0x2 << 4)
> +#define REQ_CTRL_OPCODE_LD_ST8		(0x3 << 4)
> +#define REQ_CTRL_OPCODE_LD_ST16		(0x4 << 4)
> +#define REQ_CTRL_OPCODE_LD_ST32		(0x5 << 4)
> +#define REQ_CTRL_OPCODE_LD_ST64		(0x6 << 4)
> +#define REQ_CTRL_HOLDOFF_MASK		GENMASK(2, 0)
> +#define REQ_CTRL_HOLDOFF(n)		((n) & REQ_CTRL_HOLDOFF_MASK)

Everything here is FDMA_ so why not these as well

-- 
~Vinod
