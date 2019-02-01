Return-Path: <dianders@chromium.org>
Return-Path: <dianders@chromium.org>
MIME-Version: 1.0
References: <20190131003933.11436-1-bjorn.andersson@linaro.org> <20190131003933.11436-7-bjorn.andersson@linaro.org>
In-Reply-To: <20190131003933.11436-7-bjorn.andersson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Feb 2019 15:39:00 -0800
Message-ID: <CAD=FV=Us8-VBGhwuJHCAGAxV13FOYOx2WBDegQ60SSG=oSO=EQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] soc: qcom: Add AOSS QMP genpd provider
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On Wed, Jan 30, 2019 at 4:40 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> +struct qmp_pd {
> +       struct qmp *qmp;
> +
> +       struct generic_pm_domain pd;
> +
> +       const char *name;

nit: why do you need name?  Can't you just reach in and use pd.name
since they're the same?


> +static int qmp_pd_clock_toggle(struct qmp_pd *res, bool enable)
> +{
> +       char buf[AOSS_QMP_PD_MSG_LEN];
> +
> +       snprintf(buf, sizeof(buf), "{class: clock, res: %s, val: %d}",
> +                res->name, !!enable);

nit: "enable" is a bool, so "!!" shouldn't be necessary right?


> +       return qmp_send(res->qmp, buf, sizeof(buf));

It appears that you write a string less than 96 bytes onto your stack
buffer but then send the full 96 bytes of stack to the AOSS.  That
doesn't seem like a very good idea to me.  Sorry, but your secret plan
to embed NSA code in the AOSS firmware and scrape data off the kernel
stack has been foiled.


> +static int qmp_pd_image_toggle(struct qmp_pd *res, bool enable)
> +{
> +       char buf[AOSS_QMP_PD_MSG_LEN];
> +
> +       snprintf(buf, sizeof(buf),
> +                "{class: image, res: load_state, name: %s, val: %s}",
> +                res->name, enable ? "on" : "off");
> +       return qmp_send(res->qmp, buf, sizeof(buf));

Please tell me you're joking that for turning on/off clocks "val" is
1/0 but for turning off images "val" is on/off.


> +static int qmp_pd_probe(struct platform_device *pdev)
> +{
> +       struct genpd_onecell_data *data;
> +       struct device *parent = pdev->dev.parent;
> +       struct qmp_pd *res;
> +       struct qmp *qmp;
> +       size_t num = ARRAY_SIZE(sdm845_resources);
> +       int i;
> +
> +       qmp = dev_get_drvdata(pdev->dev.parent);
> +       if (!qmp)
> +               return -EINVAL;
> +
> +       res = devm_kcalloc(&pdev->dev, num, sizeof(*res), GFP_KERNEL);
> +       if (!res)
> +               return -ENOMEM;
> +
> +       data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->domains = devm_kcalloc(&pdev->dev, num, sizeof(*data->domains),
> +                                    GFP_KERNEL);
> +
> +       for (i = 0; i < num; i++) {
> +               pm_genpd_init(&res[i].pd, NULL, true);
> +               res[i].qmp = qmp;
> +               res[i].name = sdm845_resources[i].name;
> +
> +               res[i].pd.name = sdm845_resources[i].name;
> +               res[i].pd.power_on = sdm845_resources[i].on;
> +               res[i].pd.power_off = sdm845_resources[i].off;
> +
> +               data->domains[data->num_domains++] = &res[i].pd;

nit: data->domains[i] = &res[i].pd;

...and then somewhere in this function (not in the loop) just write:

data->num_domains = num;


I think that's the same, right?  They you don't have to re-compute
num_domains by adding 1 at at time and it'd also be more obvious that
all the array accesses in the loop were the same number?


-Doug
