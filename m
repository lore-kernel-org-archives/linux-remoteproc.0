Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 22 Jan 2020 15:58:15 -0800
From: rishabhb@codeaurora.org
Subject: Re: [PATCH v2 2/8] remoteproc: qcom: Introduce driver to store pil
 info in IMEM
In-Reply-To: <20200122230849.GC3261042@ripper>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-3-bjorn.andersson@linaro.org>
 <60c10082ba90fbba0f056df8575d205f@codeaurora.org>
 <20200122230849.GC3261042@ripper>
Message-ID: <2ffeff6b57e6bb4567f00c09e5b82131@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 2020-01-22 15:08, Bjorn Andersson wrote:
> On Wed 22 Jan 14:56 PST 2020, rishabhb@codeaurora.org wrote:
>> On 2019-12-26 21:32, Bjorn Andersson wrote:
>> > diff --git a/drivers/remoteproc/qcom_pil_info.c
> [..]
>> > +static int pil_reloc_probe(struct platform_device *pdev)
>> > +{
>> > +	struct pil_reloc *reloc;
>> > +
>> > +	reloc = devm_kzalloc(&pdev->dev, sizeof(*reloc), GFP_KERNEL);
>> > +	if (!reloc)
>> > +		return -ENOMEM;
>> > +
>> > +	reloc->dev = &pdev->dev;
>> > +	reloc->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
>> If there are multiple entries like "pil-reloc" in the imem node
>> mapping the entire imem multiple times may not work. Is there a way
>> we can somehow just iomap the required region for pil?
> 
> With the entire imem being represented as a syscon this will be
> ioremapped once and all callers of syscon_node_to_regmap() (or one of
> the other syscon getters) will get a regmap back that reference this 
> one
> mapping.
> 
> So doing it this way allow us to "map" sections of imem that is smaller
> than PAGE_SIZE.
> 
> 
> That said, it means that all imem users/clients should access imem
> through this syscon regmap.
> 
> Regards,
> Bjorn
Yes, the clients are spread around in different drivers currently.
So accessing same regmap is not possible.
