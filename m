Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 4/8] clk: qcom: Add WCSS Q6DSP clock controller for QCS404
From: Stephen Boyd <sboyd@kernel.org>
Message-ID: <154940363974.169292.12160904228403236091@swboyd.mtv.corp.google.com>
References: <20190202152626.1006-1-govinds@codeaurora.org> <20190202152626.1006-5-govinds@codeaurora.org>
In-Reply-To: <20190202152626.1006-5-govinds@codeaurora.org>
Date: Tue, 05 Feb 2019 13:53:59 -0800
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Govind Singh (2019-02-02 07:26:22)
>  drivers/clk/qcom/Kconfig          |   8 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/common.c         |  20 +++
>  drivers/clk/qcom/common.h         |   3 +-
>  drivers/clk/qcom/lpasscc-sdm845.c |  23 +--

Please split this into a patch that pulls out the helper and uses it in
lpasscc-sdm845 and then this patch that adds wcsscc.

>  drivers/clk/qcom/wcsscc-qcs404.c  | 282 ++++++++++++++++++++++++++++++
>  6 files changed, 315 insertions(+), 22 deletions(-)
>  create mode 100644 drivers/clk/qcom/wcsscc-qcs404.c
>=20
> diff --git a/drivers/clk/qcom/wcsscc-qcs404.c b/drivers/clk/qcom/wcsscc-q=
cs404.c
> new file mode 100644
> index 000000000000..20306b494b2d
> --- /dev/null
> +++ b/drivers/clk/qcom/wcsscc-qcs404.c
> @@ -0,0 +1,282 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>

Is this include used?

> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,wcss-qcs404.h>
> +
> +#include "clk-regmap.h"
> +#include "clk-branch.h"
> +#include "common.h"
> +#include "reset.h"
> +
> +/* Q6SSTOP clocks. These clocks are voted
> + * by remoteproc client when loaded from
> + * user space, system hang is seen when CCF turns
> + * off unused clocks. As a temp solution use
> + * CLK_IGNORE_UNUSED flags which prevent these
> + * clocks from being gated during bootup.

This seems similar to the lpass clk discussion that Taniya and I are
having. The comment makes it sounds like we're relying on the clks being
enabled out of the bootloader again and thus we're not disabling them
during late init so that they can be left enabled until some later time.
Is that the case here? If so, why isn't the remoteproc turning the clks
on that it needs to be on before it boots up the remote processor?

> + */
> +static struct clk_branch lcc_ahbfabric_cbc_clk =3D {
> +       .halt_reg =3D 0x1b004,
> +       .halt_check =3D BRANCH_VOTED,
> +       .clkr =3D {
> +               .enable_reg =3D 0x1b004,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "lcc_ahbfabric_cbc_clk",
> +                       .ops =3D &clk_branch2_ops,
> +                       .flags =3D CLK_IGNORE_UNUSED,
> +               },
> +       },
> +};
> +
[...]
> +
> +static struct clk_regmap *wcss_q6sstop_qcs404_clocks[] =3D {
> +       [WCSS_AHBFABRIC_CBCR_CLK] =3D &lcc_ahbfabric_cbc_clk.clkr,
> +       [WCSS_AHBS_CBCR_CLK] =3D &lcc_q6ss_ahbs_cbc_clk.clkr,
> +       [WCSS_TCM_CBCR_CLK] =3D &lcc_q6ss_tcm_slave_cbc_clk.clkr,
> +       [WCSS_AHBM_CBCR_CLK] =3D &lcc_q6ss_ahbm_cbc_clk.clkr,
> +       [WCSS_AXIM_CBCR_CLK] =3D &lcc_q6ss_axim_cbc_clk.clkr,
> +       [WCSS_BCR_CBCR_CLK] =3D &lcc_q6ss_bcr_sleep_clk.clkr,
> +};
> +
> +static const struct qcom_reset_map qdsp6ss_qcs404_resets[] =3D {
> +       [Q6SSTOP_QDSP6SS_RESET] =3D {0x14, 0},

Nitpick: Add spaces around { and } so it looks like { 0x14, 0 }

> +       [Q6SSTOP_QDSP6SS_CORE_RESET] =3D {0x14, 1},
> +       [Q6SSTOP_QDSP6SS_BUS_RESET] =3D {0x14, 2},
> +       [Q6SSTOP_CORE_ARCH_RESET] =3D {0x14, 12},
> +};
> +
