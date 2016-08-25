Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH 2/4] firmware: qcom: scm: add iommu scm calls for pg table
References: <1471622000-1906-1-git-send-email-stanimir.varbanov@linaro.org>
 <1471622000-1906-3-git-send-email-stanimir.varbanov@linaro.org>
 <14e4872a-7775-4221-140a-e08d28ae9098@codeaurora.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <e056170e-75ef-6977-641f-f20e721af9df@linaro.org>
Date: Thu, 25 Aug 2016 12:08:31 +0300
MIME-Version: 1.0
In-Reply-To: <14e4872a-7775-4221-140a-e08d28ae9098@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: "Gupta, Puja" <pujag@codeaurora.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Rob Clark <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Puja,

On 08/24/2016 09:35 PM, Gupta, Puja wrote:
> On 8/19/2016 8:53 AM, Stanimir Varbanov wrote:
>> Those two scm calls are used to get the size of secure iommu
>> page table and to pass physical memory address for this page
>> table. The calls are used by remoteproc venus driver to load
>> the firmware.

> Do we really need these additional scm calls for venus? why can't we
> just reuse existing __qcom_scm_pas_mem_setup() call?

We are using __qcom_scm_pas_mem_setup() but it will return error if I
did not provide page table memory. At least for apq8016 this step looks
like is mandatory.

Do you have some idea how those iommu calls can be avoided?

-- 
regards,
Stan
