Return-Path: <govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 13 Aug 2019 18:44:46 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v5 4/7] clk: qcom: Add Q6SSTOP clock controller for QCS404
In-Reply-To: <20190808150901.D6C932184E@mail.kernel.org>
References: <20190726092332.25202-1-govinds@codeaurora.org>
 <20190726092332.25202-5-govinds@codeaurora.org>
 <20190808150901.D6C932184E@mail.kernel.org>
Message-ID: <7e86199d468df84cc2125785fc823b85@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, andy.gross@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Stephen,

On 2019-08-08 20:39, Stephen Boyd wrote:
> Quoting Govind Singh (2019-07-26 02:23:29)
>> diff --git a/drivers/clk/qcom/q6sstop-qcs404.c 
>> b/drivers/clk/qcom/q6sstop-qcs404.c
>> new file mode 100644
>> index 000000000000..b6281986b077
>> --- /dev/null
>> +++ b/drivers/clk/qcom/q6sstop-qcs404.c
>> @@ -0,0 +1,223 @@
> [...]
>> +};
>> +
>> +static struct platform_driver q6sstopcc_qcs404_driver = {
>> +       .probe          = q6sstopcc_qcs404_probe,
>> +       .remove         = q6sstopcc_qcs404_remove,
>> +       .driver         = {
>> +               .name   = "qcs404-q6sstopcc",
>> +               .of_match_table = q6sstopcc_qcs404_match_table,
>> +       .pm = &q6sstopcc_pm_ops,
> 
> This got some weird indent.
> 
Fixed in next rev.
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=159221
I have removed this change from the previous series.
DT binding change is converted to YAML.

>> +       },
>> +};
>> +
>> +module_platform_driver(q6sstopcc_qcs404_driver);
>> +
>> +MODULE_DESCRIPTION("QTI QCS404 Q6SSTOP Clock Controller Driver");
>> +MODULE_LICENSE("GPL v2");

BR,
Govind
