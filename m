Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABD2469850
	for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197098; cv=none; b=FkEOcacmrOwq81mS3+lmA55UIpfVXpLIzd0iYbiyuDz4uiJr8HM1AMcrNTzXLdkN+IcLfhbTb7LMy+yL14HMHqUJasR/dyE8JiU2R9o6fKpykTKQ4oLyJosIbhCCfFjDbPL4nTU6Y32HTlbweRR2RfLpYqXnJj4MbqX0HhxJ4Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197098; c=relaxed/simple;
	bh=HbixYzEXx1PRPxmVitJxv67tGbiTm1VQWyjni/4bsqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IN0hAVvnMWguSaCaVp+Wm2lt86As92M6De+hP7CVwzdh11jdumt82DBn3f3l/g84zjzJa+Lj3WZZgRShvI4fowL6jFf8Fw4ETZVXviIER0Osbv26KTceHqbmwQQTBGCPaPLMZ0WDBwx6KRwUSQPdv/hcVmgeCo9A13xf6atZBl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4yEu5ru; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctXCG1MV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4yEu5ru";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctXCG1MV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFpejo037121
	for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 17:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Za4Py3RVGu3jGoQM9ED6Pifq
	Ex4GFg0us87MrAwz0og=; b=O4yEu5ruP2EVSNm6/DOFH8w/GnKC+KLPevcNYcSS
	J8PL6czTAXsPl78YWYt+oK84dN1txJsqmryED0c+LCCl8sQpRHB58aeUxBquqfVM
	lI5XVS6WK84qFkmvUDN+aXuRxZFEkXYwRy0gFHxX12Pq1y9kjK/tnVHTc1Dr264+
	aTdUfAr7HX+VsvGlbPQ4vnFWSX3LDdVxyqRJVyopcefs1qUDu2ckuHo6XmlaOiQn
	roWWe262VX0RF34vcYXDiCTWuLykmYkI2+WMFr/Ybfdn7AZGn4tpnyiKv4X6U77N
	+ElXhpKtrwU28YWSjUuvp0wl1+7736WLqvxmZk2aXsr7Mg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jgj7mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 17:24:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso5298881a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 10:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788197095; x=1788801895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Za4Py3RVGu3jGoQM9ED6PifqEx4GFg0us87MrAwz0og=;
        b=ctXCG1MV+xhDbEZl3AexSxHQG0wZ7AObti9vrDDkwcAzhKw3Sh4VehfnAEStcj9vLa
         C3Wz/k6q0AcwA4PvBsxGjDVr3AYT4HkpdFEcpMirzlVfmxNRTJHdV2eyNnaUSbl9FMH1
         +hWPcb6fy5lOAXnKz1/CeX5q3gvdPtSWFYmwXSJktONX9G05NUlg8HFZQ/ylv1h9KtOH
         +If7dzr8LAw69qg+k4r6cWTZleyX3oh/eNwFM21IrYM87/u+CylR8Di9G0A4qTt+ORX0
         NiwqKhLhLEiE5xjCWWoTDZnnI9jMBjNqePJClKSZ1suLHyLveqvGCVinaKc2HpzeHVDP
         Rdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788197095; x=1788801895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Za4Py3RVGu3jGoQM9ED6PifqEx4GFg0us87MrAwz0og=;
        b=axi31opJsiERKs1li5XjsO+iGnPLeXXR0RafMfN/k4MGqMLjvOuq2gg5Hyyp99rQBr
         RnCedVJz/2vAZ5oMEsqB+2wEERXHBRaiuHVmNtW+W8AXUr2z8T3OzBUEYdqs0LFx9AVF
         X3TolvOp9sYB0GLG2UwB9aUWQ3omn51eeaAVHQEALgSyUDKEA9UfIci1cp55GE3MIpaF
         GVplzt1dkP69IMYK7nRgxsK+eZK98lMOE0MvcWjgAStOoR0J+QGmWz9r2CHvoOf3oOWi
         hKtawxZ9BcjoKw9sGPduoMPCDTD4kQeYzm125hGsE/IIe2qY07FM95wLaDLwHxTujVst
         UNUg==
X-Forwarded-Encrypted: i=1; AKwUvBzzKc5ljSvNA8rZ4MQkYN03ulTGcRGVIj2vilA1WC5P7pFc6oCC/h4cJkhGr/lHaMySDGd7HESBQ/ogay6tSI+a@vger.kernel.org
X-Gm-Message-State: AFuF++lCeCp07q6qeWgzfEyhj8znki0WDXhR0IzRs6DMvB8i9PDKQRqX
	Djb+QuFiZHTf4litAwPIthw/9xjBl10s+p2bGhz/hvzF1DlVZ++FQX9RZg9fu3fSYOHh2TWDbYO
	Cez2AtFNFWqjPchaA+UjRtdUMTXjAokt/Bqc+FbobnS44DUcm5UHArfF64UoA1MJeRnrJMJXK
X-Gm-Gg: AYBFou3OMCX6RG0pTCJ248wpqdolxHJYsqY6VNY/slQYdUMNu0tFk6SzDA6ZVvUYb+c
	Ii6TW84+9VdR7RA0x9izBUZZWmnUvYeydrkYkz0xmzI40p0cMiRQgz09aiRBi1C7Q9AgfPGQvjt
	aatLXdGftk94CBwHSqArp/9qu/L8XlDOfYx3WssRy5FqMgitbqKvBZ9M0LsGjphiMqGsLyKcPKk
	VUg+StcgyctlhxpyJXQkVTt6xPC4cFPs2poBjDPhL8SURFJjsTnZ9Pxon2xCUAYKgyz5/RO9NkS
	X9wV7iM8YQkSBQ9T4kTHP0cfiPuUQ35eOVfJn93nFkKI6i0AgrKx+RDcr58JtxeaLj9+JtAF7qN
	WiN2pGA1HAlRYqjnYjB4TduQMJT0=
X-Received: by 2002:a17:90b:2b4b:b0:398:9beb:5c18 with SMTP id 98e67ed59e1d1-3989beb635dmr29307796a91.19.1788197094550;
        Mon, 31 Aug 2026 10:24:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4b:b0:398:9beb:5c18 with SMTP id 98e67ed59e1d1-3989beb635dmr29307734a91.19.1788197093957;
        Mon, 31 Aug 2026 10:24:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm34060325eec.24.2026.08.31.10.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:24:53 -0700 (PDT)
Date: Mon, 31 Aug 2026 22:54:47 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: qcom_q6v5: Skip handover callback if
 already issued
Message-ID: <20260831172447.bwyf7xj646z7rrme@hu-mojha-hyd.qualcomm.com>
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
 <20260828181311.4038346-2-mukesh.ojha@oss.qualcomm.com>
 <apUWoCCfgthl40AZ@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apUWoCCfgthl40AZ@linaro.org>
X-Proofpoint-GUID: qQJ8jca7O4LGDsqALB-85Zp54BS4xllB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE1MCBTYWx0ZWRfX0MMVMHwO35o8
 HKjGm4XE2rY2qB7YS1NdC1iGOG06k/KBaqfydnCjVlOvsxzpKmIoQPkonNTvfM8mZYLa33H9Bai
 t5FgIhV0CKDlWE0UQdHNWmlEd29uw9I=
X-Proofpoint-ORIG-GUID: qQJ8jca7O4LGDsqALB-85Zp54BS4xllB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE1MCBTYWx0ZWRfX1EVBh9lqizKz
 cfySQA2HI7AQESH5rkceA1sqINUDQZ9WYMXjCIy+qLNejYHu0iR3Ymcm9uAj4Q0fA+LAQfBRkat
 aGAby6fA9Pga5FjGs39Mv9taZSj7X1saL86666QN5fvQLgaIIGy70vFy59k621HerNBfIRts1Oy
 dOfRX/W2OmnPXeQ1dR9CLkFWjH5syb3wSulnH2PUDWYFp+/pSIlDAxpxm4L2DOmsuWUNUgek61r
 a8kXdC3Ez/hDEEkptxi8VAk0I93swDF14kPEwmw0w/eDZDHQGj3WW+GQCGCJ+T7RqRJUmYFyBth
 awETnB4sVHN0aym8my+OQS7ZUcekqROZxfBZHm8IlGutZithQLM7D0lFhnlH6tJlxyt6A0upoMb
 YJQT0HruUhpo16rnTrPMD80hYki6/R28GVkySWRTI9VbhnzD96DIrHdTuRitkhmufiL7fkBP3sC
 rFG/3NlofWh0V0y3fQw==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a95b8e7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=sks43m-1jzInu8jmEAIA:9
 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310150

On Mon, Aug 31, 2026 at 07:52:32AM +0200, Stephan Gerhold wrote:
> On Fri, Aug 28, 2026 at 11:43:10PM +0530, Mukesh Ojha wrote:
> > When qcom_pas_attach() is called (subsystem already running at kernel
> > probe time), it sets handover_issued = true before enabling the handover
> > IRQ. The handover line may be high already (from bootloader boot), causing
> > the IRQ to fire immediately. Since proxy resources were never acquired via
> > qcom_pas_pds_enable() in the attach path, the resulting handover callback
> > calls pm_runtime_put() on proxy power domains with usage count = 0:
> > 
> >   genpd genpd:0:d00000.remoteproc: Runtime PM usage count underflow!
> >   genpd genpd:1:d00000.remoteproc: Runtime PM usage count underflow!
> > 
> > Also, because the old code left handover_irq_enabled = false after attach
> > (fixed separately), the handover IRQ was never disabled inside the handler,
> > allowing it to fire repeatedly and generating multiple underflows.
> > 
> > Fix by recording whether handover_issued was already set before the IRQ
> > fires and skipping the handover callback in that case. The callback
> > releases proxy resources that are only held when the normal start path
> > ran qcom_pas_pds_enable(); if handover was already marked as issued,
> > those resources were never acquired and must not be released.
> > 
> > Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Shawn sent the same patch already and the same comment applies here:
> https://lore.kernel.org/linux-arm-msm/amxf7MODINj26a4m@linaro.org/
> 
> v2 fixes it properly:
> https://lore.kernel.org/linux-arm-msm/20260801011731.1084591-1-shengchao.guo@oss.qualcomm.com/

Sure, thanks..


> Thanks,
> Stephan

-- 
-Mukesh Ojha
