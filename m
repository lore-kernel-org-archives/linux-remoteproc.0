Return-Path: <linux-arm-msm-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20171130011644.9421-3-bjorn.andersson@linaro.org>
References: <20171130011644.9421-1-bjorn.andersson@linaro.org> <20171130011644.9421-3-bjorn.andersson@linaro.org>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Thu, 30 Nov 2017 09:18:28 +0100
Message-ID: <CAOFm3uGR23XSfu3jS0r6=HwcQV1SZCqCrO6c1HQUTTg3dC9LJQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] soc: qcom: Introduce QMI helpers
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Bjorn,

On Thu, Nov 30, 2017 at 2:16 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
[]
> diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
> new file mode 100644
> index 000000000000..4027b52b0834
> --- /dev/null
> +++ b/drivers/soc/qcom/qmi_interface.c
> @@ -0,0 +1,857 @@
> +/*
> + * Copyright (C) 2017 Linaro Ltd.
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */

Could it make sense, especially for new files, to use the new SPDX ids
and avoid adding boilerplate that will need to be cleaned up later?
e.g. something like this instead, using the new conventions started by
greg-kh and by documented tglx?

NB: the // comment  style is not a mistake and is what Linus wants
there. See the threads on this topic.

> @@ -0,0 +1,857 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2017 Linaro Ltd.
> + */

Isn't this shorter and better? :P

BTW, if you need help to fix this on the rest of Linaro contributed
code, I maintain a tool that can help there.

-- 
Cordially
Philippe Ombredanne, the licensing janitor bot
