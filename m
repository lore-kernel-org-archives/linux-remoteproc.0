Return-Path: <jassisinghbrar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170504200539.27027-3-bjorn.andersson@linaro.org>
References: <20170504200539.27027-1-bjorn.andersson@linaro.org> <20170504200539.27027-3-bjorn.andersson@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 5 May 2017 15:56:58 +0530
Message-ID: <CABb+yY2P=qPTYB6PDkjV82Qc67Xzer40BHRsOQP2m-gM3eK_UA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
Content-Type: text/plain; charset=UTF-8
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, May 5, 2017 at 1:35 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> +
> +static int qcom_apcs_ipc_send_data(struct mbox_chan *chan, void *data)
> +{
> +       struct qcom_apcs_ipc *apcs = container_of(chan->mbox,
> +                                                 struct qcom_apcs_ipc, mbox);
> +       unsigned long idx = (unsigned long)chan->con_priv;
> +
> +       writel(BIT(idx), apcs->base + apcs->offset);
> +
When/how does this bit get ever cleared again?
You may want to add last_tx_done() callback to check if this bit is
cleared before you can send the next interrupt. And set
txdone_poll/irq accordingly.

Thanks
