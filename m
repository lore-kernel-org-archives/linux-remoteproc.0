Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE97285C84
	for <linux-remoteproc@vger.kernel.org>; Thu,  7 May 2026 05:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778130262; cv=none; b=LCYjvxrSmEV+0hLTT5Y/UDI9zvc7XmoPT/U/L/4P/v4aXg8zgR44PkJ7B0e00WAUNEr4nEohu1jQdw1PncGF+Shnj+EfFWhjyJZDW9X5PRGREv4II6R8CjcmUK9pwediqGnWn72ZA9nu/sfHNsBr9ldX4B32iU8cEfi22unvnxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778130262; c=relaxed/simple;
	bh=hgqjW8KfkqTcrWolB9guuKyPRLtFQrE2y7JWIKYzEvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BM22qiAdO7YQXUGqNofg28dvJTHyZRbtnH65l3c3ywsfmzh0UvBM7c1pfkC9qyN5T0kJ2NScB5h3K79DMeE0e4HGxliKzlkCZG45nXDAbIwxqYP07Hlwj2rM/IScYJ2r4+KCIQVsxdpgkPVDhhGZnMLL2FdtgiZ7DZUyI5SBrts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LO7AI3SB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+Q6ElVk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LO7AI3SB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+Q6ElVk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64744dhQ151728
	for <linux-remoteproc@vger.kernel.org>; Thu, 7 May 2026 05:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=udpIyFeLuuX33ymGmzPtSW/W
	6I5xBEaw/yKDVf5r3nM=; b=LO7AI3SBaYnt4ROPEdpYdRP8zwPlm/jqsw3QVPs2
	N2BFAHROpPN7i+v+QhuTpWO0uzfzEU0SSjkHITB047Eak/tvPxrEIdcGARAEyaDh
	yUL+w25b34apgLNyaHZUS3wOqHTwgfsP+IYJHT8ZcRAlDeU+vCZl5/YhlNnl8gEg
	7YH81a5IHJF7EOUoQsJZp38AlkRf6LN4plyXG2yU3TpN1thKeUlBsIj5APdx/RJf
	u4jw4s6G5Tw/Vx3zOvAIdpKaSbwEK4dNWuQsNP3fRq04EKRT8S03bCGHV49TuNGj
	xPukBWGxaC42wtX1PJ65PYJj/ypzP/AjGEth+pc65kehyw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctr4ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 07 May 2026 05:04:20 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-130aab78a09so462835c88.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 May 2026 22:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778130259; x=1778735059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=udpIyFeLuuX33ymGmzPtSW/W6I5xBEaw/yKDVf5r3nM=;
        b=P+Q6ElVkI7/poSx+Vq1A4Y4nwQDbfRE9OD4qt9v28wunZUXPdIYyWB8Cng0l0wTUtr
         ftVIw0vt6qY1fRS8F2LFmlIHAdNW5rCL3mnXz4derxkirYUaWwkxBLU2qZo6omdlNOG9
         ey+UT+/5XMEkBbsFGIgSB/QLGam8pwcfmlsnyeYQjVn8x8JLWNIb7UreZIUGGTgU/647
         wzfIdEB1WpAiguZsJch/sPs5tsUT1bDtBNODF4YYQNVd4MTiQEQUZ5bcGPho+4LLUbUh
         NmiNKYZvsIX41f4bG4e7jASsS93ZWxy6PYqZQhhfUFxZalaQmj+vHSkmEr6GQT4vPkzd
         6GLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778130259; x=1778735059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udpIyFeLuuX33ymGmzPtSW/W6I5xBEaw/yKDVf5r3nM=;
        b=pSd9oPMp3v2f+oEpjmSiiPSE5iAmZQ0FG6UNiXQZFGwkEqotPEjCUfp9z5ZSUaZbTL
         tZn5WYMFH4X3lEizv1IwTgO8mABWaJxKLfGcDAp1IjSci4eRulRAuhbM1DswM2PAiJ2z
         7nLDYjxZP8IEsq/2E7PERowrgiVAMtZeFGJOQxOaL+9S8Z0vTRCjPmPYBp3gc9FjTBU2
         xWygVpEChDAHxCn4yCOSk4I8Gg0As09hCkYmFPUrb7qXamdXyEf82epgnTGcPP66X2oH
         eEe1rSyIUije2wYAvaTBLqcaaPspa9KRqEx5SdTj2KrkmlAz8IRqZb649YnHP1KYAwDq
         +bCg==
X-Forwarded-Encrypted: i=1; AFNElJ9HD1iQiDcyI2uHbg9XQ3fhFQIC2JRHwnMnqmKUXgHBkdDU0dLYvUUsAiWWgjfJGclgJ5dqiendTvbzaVRG2SnS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2QFrtBAYK+YmYdzr5C0QQ4wAUl53LElHyiUDi7NRleOF+alMY
	J7rUmoFgS8Wa5XmW+28wqmduoX7eiIvFwu8IpzlNtDvi+ABuafXNTBKNKTqhUzBAVlJUCh8nbA2
	iXOnJ79kNFsGzoBMAi46nxINfPC64SBuHOjig3eMLRFGZvCWTpYbglnGd+aWxIvo1IZIK5PYI
X-Gm-Gg: AeBDiesAsE6PU/1pe3Njv5/S4V7kmvAl5AgKDr2HMs4+ZcX0k4+DWdzuAZDx4afIyPc
	Z5lqHjcfHn0AFPKzUG22CwarwthDueg2Up9Q1enRY/wWNvQ316RVv2smiV2gY5XR+tAooN4c/3q
	2xevu4YO9K42TajaYYKQi78HiOH3AnDam23Fgctdkm4NZnw6bZ8l0AH0wk4W3S6yJ4jxpN/IAaV
	3ftNRFOfgDFFymKACgvd/MrzkgtlZY9jK+0CfMNRbwUKS/HbnX4l//g4sMvW/4XDnOg+LS3STbp
	QAcfLRNWVs90eiwfnW6ihindVciHFD2EWBNiKG26TfmKVUaKL1V4oRsa9cL9rW//LhO0rq5uw7h
	rUXl6GJ0dHv2rsNtdrIuXJl+Eehgobk5tRw38ER4V7JPiBSI/TrAK6HyLzgivq6drXkSnrSQX95
	0=
X-Received: by 2002:a05:7022:f005:b0:12d:e539:98e0 with SMTP id a92af1059eb24-131963a0fa4mr3238567c88.39.1778130259271;
        Wed, 06 May 2026 22:04:19 -0700 (PDT)
X-Received: by 2002:a05:7022:f005:b0:12d:e539:98e0 with SMTP id a92af1059eb24-131963a0fa4mr3238544c88.39.1778130258627;
        Wed, 06 May 2026 22:04:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec592asm7142762eec.5.2026.05.06.22.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:04:18 -0700 (PDT)
Date: Thu, 7 May 2026 13:04:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <afwdS5euY8bxxA16@QCOM-aGQu4IUr3Y>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
 <adm37MruBfXAjLpZ@baldur>
 <7bd01424-e611-449f-b5e0-7c823ad3b978@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bd01424-e611-449f-b5e0-7c823ad3b978@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc1d54 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=DzB75-1vIS7bBwd3HdEA:9 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: rHicsYvDBcSiRYpw6HZuUPwB_PPW5qSG
X-Proofpoint-ORIG-GUID: rHicsYvDBcSiRYpw6HZuUPwB_PPW5qSG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA0NiBTYWx0ZWRfX5jXUnY+PRgXa
 0NoVzf5CNOUJZhqcfHKa8LmUnf3LtxvkpRqUmKzyklrFjCS7Ui8g2CHjZHn8HgOylpt3ESs7RcW
 79Grn5u+FRLh0pzWqSRl8KhYpwVCDN6ZIDXBtDParcTNhaWOGfM89Yi5wx09r4hNVGJmoQS7bBM
 XymrxrkSGGXjfADd7tlQmo5ySgvXHQu6QoxWn4nVVflWXU8A2ceJvCStsPgLjU1kN02tCsG0K/s
 0Rpom/NL24LkMSP/rvorhnvr0tO7MlHEXbgcxkeJojlndOukSHvP7KMhh+p8kBiRiXqIL2PYpnP
 IRhwPyum6gYHUySvdHN263ofLO7pMMZZK1M2/6YTLesxlcpvUYckAsKqcyoMBjpEvcBf6JxwXRa
 8OHSpTPBvMmmpTVfeOAB3sSGtCu4drGqdvkvqJbVhxAxwKuzDSgKhXTijf3c9mSAlgdXCOLJToP
 LJmtp5mFNkr5h7NTLfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070046

On Tue, Apr 14, 2026 at 12:56:11PM +0800, Jingyi Wang wrote:
> 
> 
> On 4/11/2026 10:59 AM, Bjorn Andersson wrote:
> > On Thu, Apr 09, 2026 at 01:52:27AM -0700, Jingyi Wang wrote:
> > > Subsystems can be brought out of reset by entities such as bootloaders.
> > > As the irq enablement could be later than subsystem bring up, the state
> > > of subsystem should be checked by reading SMP2P bits and performing ping
> > > test.
> > > 
> 
> Hi Bjorn,
> 
> > 
> > I still don't understand.
> > 
> > Are you saying that devm_request_threaded_irq() will succeed and then
> > calling irq_get_irqchip_state() will not work? Or are you saying that
> > SMP2P driver isn't reliable and we're loosing the ready or fatal bits?
> > 
> 
> This says the ready state is getting from irq_get_irqchip_state()
> instead of q6v5_ready_interrupt(like what rproc start do)

Hi Jingyi,

I guess Bjorn is questioning "performing ping test" part. Is that really
required?

I'm testing this patch with Nord ADSP which is brought up by bootloader.
I have to remove the ping test to get the ADSP attached, as it appears
that Nord ADSP doesn't support pong. Are we good to just check ready bit
for telling whether a subsystem/dsp is already running and remoteproc
should attach to instead of powering up it?

May I ask you to copy me on the new posting of the series? I would like
to make sure it works for Nord ADSP as well. Thanks!

Shawn
