Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D913E5ED6
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Jul 2026 07:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582675; cv=none; b=FIgqnubt8O2NtsTr0Qh5GWZyngdGs2wPY9mmCZVQlCByq3Up9uzBtKXHtGl9ynzoZnkYoKpfYe5bha1ajLUslnMWVbTQIgrmL1nDYwIIJYJbXir6ogmDkJS2KRfspEcmAwFltQCw+WB6s9BBx2sNyMu+Q0/UjsdUfOUYrsg+efg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582675; c=relaxed/simple;
	bh=0rb2z3DUXSytPJ4s/yhJPqz1ccr0bjpcfkzPhntULf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ncs7tsszM8a9+FZxYskDXb0G2wZzMGV4qEVqA9uy/az7EAjCbIwmZp4iGBzJql2aHNSG6VWC6r/e3Qt2Av6PgXvzJlcA35V0s6L2dnPr31O5t4evTecUSdt4t1adlo7C8tlUssIh8G6jlxOtiol1vlWrO5izLVrh4dZfwmUGylw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5Nkna3h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9hvmvg8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5Nkna3h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9hvmvg8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960GLa887925
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Jul 2026 07:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KZxwMa68WHmSw0U1mRfk+2UfIqOZzCIE2fnSeRv4BAk=; b=E5Nkna3hY11WSfQK
	vr+dNXe898mO24TUgsPtlORCuXmQ/fMZykF8MNGuL+exlhr4QYwG1pIr9g1SssKJ
	gFfJU9/dP3WrEfoZDf4lAs0d2wQkIh3BFhlnBDWuh37SOsJ6MXTncX6L5roL0Qjx
	GNF/dWJCgBMx+JX9vAcP51D1vxtan/46/9TqW7Ykh8STedXOonakepaQQSGlbeAf
	8day7RkrvJjv7cYyozuN+fZWuKZE+bOElpRyKYcY51fOFn4G/I0REdWt+HvkC8mD
	6/tyBhWPfTzGH+efIoBGL7yT04iokx3jyfafnMIhlnJz+wiUW1BZIcvf+7KqoGKb
	dTzcig==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33b4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 07:37:49 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96925b219aeso416236241.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 00:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582669; x=1784187469; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZxwMa68WHmSw0U1mRfk+2UfIqOZzCIE2fnSeRv4BAk=;
        b=T9hvmvg81GQ75VcMbYS8vIKFwFca9VEArOzuzJOvKC0L6i/YvD6e++CY9xKHdcCaHi
         4TTNV8cCtnEHGTJ6W56TGM1WfEYSVjymZRq8crbNfOKKtrdeYVX7iuLaMqu/l16P15hR
         laBK2IyU83+/YgtMXvf5P51hgR2nYj1lhxUKFd6qL6qU9PMKuWcQ68wYsRjB69VY8x7u
         ksRokPepm30pep+jIwxEuibJMeCB/du5/JCLpCFEhn4K6SejTNU4o9nwqkg9g7VM8f+9
         UzQSg+qJHf5Bvjcf+5tVwEJZ9D4fT+2BRhr5HTda2QN3CCgb9Zt2Dr3SUu3r4vzjSbwO
         r2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582669; x=1784187469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KZxwMa68WHmSw0U1mRfk+2UfIqOZzCIE2fnSeRv4BAk=;
        b=RWk8hkCaOTexYNBc/KU4PDUsgrpD76C75aneRyJAU6H+HLdc1uHxMeeEElF3c4aOIW
         EhaCP3zQbaqJKaAS/EcIwypBgj0K0gC1NpIny5ilDVopQxTPvjBtrD7cNw6R3ftUIFiI
         QRuU9g3C4LVFqcRio3PBbsSWExHGgAT6VUsXes+F/8qHZKoSeFJ/ZlaeY4ccO+RLdYcT
         FKHSi6vKccxHxRNokQGK4I6yMoYWju+PdbvhE0LPE7MfEcrxekELPMWqBv3Cm6Gyzw6F
         mwcrS1Waxu2LzU+IQck+s80hxzuqq4KIiimSDSrCHeyJr3kDnZEb38ILNbjNvR3lCZGr
         538A==
X-Forwarded-Encrypted: i=1; AHgh+RqJ0Qce8mi41PM4m6FJBgJhMV4rG2n6KdCz01/cx9UOW5YCXEVokpH48M9a5zPehh5DDiIj7hsoqkReNrOTsurj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Jd4KcCy+aS1kG3zUkJ7bmjzNNlqxCMKOH4Aaoz1AxMjY6DhD
	28HllMBWK24Oqze7jofsmJ/e75fyluRSskJtXt01HTAg1QF+ajF6tdaeVm5NgkQC5qC3yfe6D2k
	l8LsxJa+fTTM0KiB5wzTNfjm1cdqEP3bzI83/QWOwWz7ROl9jZN95lDfSWtX1onQSso2123Ik
X-Gm-Gg: AfdE7ckL/EFIpvZ16RQabAa0dVzhZh8/k73jI9vvhqVOe43/lMlP/G7UzFxa8/3GnzJ
	bGdSHOdMFqhdPCxMUkh3ANWvoJftAW+erC79zYjD71Fa11Q0YgfeYKUs9P4VN/uAE681SGQww3m
	yrZz51JBvpgE2Xkx8MZ35RwzLlx5rNsnLVQ/miLpLPwNAP7D4jHQCGYsuXofdTJSyvNUeAFkEJk
	09fu4zbvNeOHbP8hfIIQKhyGw45zwdgQgYMYx8hRTd6B64LVQGkdYHJDFkyny2pKTtirhbRPk5W
	qLMweY+LHdvXuM9qVY/k7gwZx9srQqree0IRE8KtiVFmvzDY9fc2oLj/R83yPmNpgus34B1mL/J
	gWDMf2iUzWQIB5uQpD9Gx7bx1v9peACA89YPnjugV1IsYtBEgRlRaINRcyCsR+mDB0oi0HOPbWK
	FltJhPaDp4hcANH1djTfTW21XY
X-Received: by 2002:a05:6102:3e0f:b0:737:783d:1900 with SMTP id ada2fe7eead31-744dff69b8amr3548340137.9.1783582668568;
        Thu, 09 Jul 2026 00:37:48 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0f:b0:737:783d:1900 with SMTP id ada2fe7eead31-744dff69b8amr3548324137.9.1783582668113;
        Thu, 09 Jul 2026 00:37:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb4a6sm5005295e87.38.2026.07.09.00.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:37:46 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:37:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD
 device type constants
Message-ID: <tq3g6lpb2go4nen3ferx7kzs5g6sshc45ayfyvhjmc3rv3jv7p@fhixqlwbtooa>
References: <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
 <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
 <9dc4b29e-e9fb-421a-b789-eb16a68ff915@oss.qualcomm.com>
 <2tu35aavp7sc2npni33ky5bve57idzy3bzp2pk7eh5lryq3r4v@gmm3dhayu4cf>
 <6f179f96-fdd1-4fa9-b26c-df7372eb6d20@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f179f96-fdd1-4fa9-b26c-df7372eb6d20@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BVJbPsOuaLCzLyknhj1tkRMsqUJANVyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3MSBTYWx0ZWRfX0yBBoLofAv4/
 vgShWdFpppghvclx1f/b8KkksYu6Lanrz9qGpZ15s/e097Yel6ZminUYvjdLDuuMZUXUTQrU3r9
 RC+lHahuOXxM+iQCap0jRteLZ6u70fVu6GZB7vDrOb/PERjNAoaWtUN5X7DiTJFxMS9yqQXsVMf
 BAudonX1CztJnTyU3JpQg0pIqnx66jPKN/YH7cRTTNPx8iS3vw3VConqRUnKDOYkXAa9j9SjbVw
 i6sN2Ntq7w+JllHUAbToAbadtn7e1ztVPmtc5h4ydK1ax9311YbVJDYmfz6MzNAqsQeVimCs3JF
 GrS6tXEuB5FUDjvwUeFffUh+eiuGN9zn5DgPmJQEBfEGvgTBuj1HIP7OcwZmeyX9peghGWragtm
 7XJzHgaqGXpqlU+kdW1k758s1P5GznLyE/93JL3ua2y2zYCVSNtjGjY2fjTBiw3ycBlIeoD/TJR
 /bM1ZWYezTydMH21iAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3MSBTYWx0ZWRfXy4eCqGS+o1DH
 8QYXca7bKv4rtACxH5V4rNLI45oWA59YA9uMwzPoMDWML7EG8zPwuMz+aIHQJIPyUsQ87wTFBKf
 G1BxFAWGqRK3YGH96F+RTq3pnljD3gA=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f4fcd cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=Z5p1CHKkuMEdEvxWcW0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: BVJbPsOuaLCzLyknhj1tkRMsqUJANVyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090071

On Thu, Jul 09, 2026 at 10:54:26AM +0530, Gaurav Kohli wrote:
> 
> 
> On 7/8/2026 7:55 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 07, 2026 at 03:55:13PM +0530, Gaurav Kohli wrote:
> > > 
> > > 
> > > On 7/7/2026 1:04 AM, Dmitry Baryshkov wrote:
> > > > On Mon, Jul 06, 2026 at 08:11:35PM +0200, Daniel Lezcano wrote:
> > > > > On 7/6/26 19:47, Dmitry Baryshkov wrote:
> > > > > > On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
> > > > > > > On 7/3/26 17:42, Dmitry Baryshkov wrote:
> > > > > > > > On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
> > > > > > > > > > On 7/3/26 7:03 AM, Gaurav Kohli wrote:
> > > > > > > > > > > Add Device Tree binding constants for Qualcomm Thermal Mitigation
> > > > > > > > > > > Device (TMD) types used by remoteproc-backed thermal cooling devices.
> > > > > > > > > > > 
> > > > > > > > > > > Qualcomm remote processors expose thermal mitigation endpoints
> > > > > > > > > > > through QMI. These endpoints can be registered with the thermal
> > > > > > > > > > > framework via the `#cooling-cells` property on the remoteproc node.
> > > > > > > > > > > 
> > > > > > > > > > > The QMI TMD protocol identifies devices using string names (for example,
> > > > > > > > > > > "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
> > > > > > > > > > > `#cooling-cells = <3>` requires numeric device id in the form:
> > > > > > > > > > > 
> > > > > > > > > > >        <&phandle device_id min_state max_state>
> > > > > > > > > > > 
> > > > > > > > > > > Define common TMD device index constants shared across currently
> > > > > > > > > > > supported platforms. If a future target requires a different mapping,
> > > > > > > > > > > additional target-specific constants can be introduced while preserving
> > > > > > > > > > > existing DT ABI.
> > > > > > > > > > > 
> > > > > > > > > > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > > > 
> > > > > [ ... ]
> > > > > 
> > > > > > > > Why are you using only those TMD devices?
> > > > > > > > 
> > > > > > > > > More constants can be added as needed.
> > > > > > > > 
> > > > > > > > Kodiak is one of the supported platforms.
> > > > > > > 
> > > > > > > What would be the benefit of having more than thirteen cooling devices
> > > > > > > declared in the thermal framework and having only a couple of them mapped in
> > > > > > > a thermal zone ?
> > > > > > > 
> > > > > > > I agree there are more TMDs but if they are unused for the moment, why do we
> > > > > > > need to add them ? Can we do that incrementally ?
> > > > > > 
> > > > > > That's what I am trying to understand: why the implementation uses only
> > > > > > the selected two devices, if the modem on Kodiak supports others. How
> > > > > > can we find out, which TMDs to use on other devices.
> > > > > 
> > > > > My understanding is that is an initial thermal setup. Gaurav will add them
> > > > > step by step while setting up all the thermal zones instead of sending a big
> > > > > patchset. And TBH, that will be much easier to review.
> > > > 
> > > > In such a case it should be noted in the commit message and/or cover
> > > > letter.
> > > 
> > > Thanks for the review/guidance. Not all TMD endpoints are relevant for
> > > kernel thermal zone binding — some like BCL and cold temperature are handled
> > > from userspace when needed. The constants here cover only
> > 
> > What if there is no userspace? Or the userspace is different from what
> > you expect? I doubt we have TMD-speaking userspace yet.
> 
> Thanks for mail, The TMD userspace implementation is available upstream at
> https://github.com/qualcomm/qmi-framework.

Is it?

lumag@rohan:/tmp/qmi-framework$ git grep -i tmd
lumag@rohan:/tmp/qmi-framework$

I found no traces of TMD there. Moreover, I don't see why QMI framework
implementation would react to thermal events.

> > > what is needed for modem and CDSP thermal zones on the currently posted
> > > targets.
> > 
> > Again, SLPI, ADSP?
> 
> Sorry, I should have said "generic subsystems" rather than listing specific
> ones. SLPI and ADSP do not require active thermal mitigation on these
> platforms.

Could you please provide details, then. What is cpuv_restriction_cold
TMD?


-- 
With best wishes
Dmitry
