Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA57C30C345
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 18:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755628656; cv=none; b=keO8gJhlZdRQrdv9vmAWbSnqkt008kNrgNBP8vTd6j+wKhrk0vuVRTSIHa1u1dZ13qDsVGcmuY+KV5jwwYxoEpqSgotYusIiUwmEJEoBvqAaIhPDHkdOcQvMmEfGybBmBJ6OClgdfD4MDWsua2Mw0x88cJ6pMBpWaFYtxZUCTh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755628656; c=relaxed/simple;
	bh=Pdv81BMM7kCuOjJPFUlIlZjlYr4uZ4fxBzQBmQqdYu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNw7T0rmRAOxAn/V6/0goasr2CivOYmqf2A8ggw6xseLBw6bMEg/lh6KVzykXVwobC/FAwKuhZAc3yyK1yHA0vBF5kiWvQalKB/ngkLihhPc2fYDgmfDAhxHsuoDVOMTuxz2VHwNz9nixdQNadwk1GIABtP/SrBDvyEDiXhGKHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VU94OYN4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VU94OYN4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JGpRCX018046
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 18:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xZfnogI6WpgDksp0nKQ6I3VT
	GYZpsfSvZDFAnG6Y1vY=; b=VU94OYN4R5VTLyKVzN/Z2tkdy2y+PIBj0IxmdMr5
	viHYDaNguJO7c5O4ZsfgLAbiRI1ZbhR3H8I0vy/n+MA/1BW2L7mKH/rmLwznNCDU
	z/OYVSp4hrg8OjfcWHBbaj/5CkTOI4ydutfKbcVY5TSr/NlaDyz+sZUeH0m3b1TT
	e6J0rbOCoEenNYdrZzP2C4r6pdjEoGnACBZloRPKtLHCZLvqwieZoQXmludqF6d5
	nfH3kqp2uw723vSH0pKR4EqmwPl+OD04GMUq1p5lqeL0ZFq0nsAbGCXKiTIKlLdJ
	Rv4CHBqdjP9rvA7CeRQr9gXKuAnfpS6FrvpchRjwjck4SA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhah1hvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 18:37:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109ae72caso157029241cf.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 11:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628653; x=1756233453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZfnogI6WpgDksp0nKQ6I3VTGYZpsfSvZDFAnG6Y1vY=;
        b=g2AgYaZ4VrGOmlOENlFC1zou64T7d76u/qAhIeU6rrt8C8RTK/ye4IqUJlSkB6JKgn
         rDGLPuvzU9FDkvnZr9bY94vrxJ65aUvxn9rAAEDpEFP/q4J981NIj3DyrgNaaPoo4akR
         wL1m0ektwQ1NwBPMwGKp65O6dGMpli4ypBxBq1GAykaIpPJPKDC03A8qfDBYMaCl00oX
         ctA+idWdSRbkXHoOnITBSX2RJXhUMH/hgpOETYN/8jh+sz5I8LGqZCo6a6oxy+iUbKGz
         QIf1UAQEBHmMMTjiIuMQvvVshCFbeTlwdSIDwq3uQZs93G44orLFWApDfa2EYJRogLSd
         jvDw==
X-Forwarded-Encrypted: i=1; AJvYcCU74eYEPKmD4x5zQ/5CzlnQLdYEKcVjlK2+/Cok9ty8wXjzldqJdcUR933DCRZRCcOLBwfOX2SabqkXy1rvJypW@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZaYxiHXfx5Av3cVVQE51l71MBlqKRegZk5ajXdoXWt5Na+p0
	EYj2GWL13iYJ4iJtbYXFAgS0Xe+3lKxNTElUFER2lBPBlVM8kBIY4HXTzDH2VXNCevGvWKCR1Kl
	gJ668DvZd4S8WoKjphNudMb04pCYRrpyTHzbeft6iSA3s2ieIV9WjM+AJDEaCeLW1y9Rp4BBV
X-Gm-Gg: ASbGnctDR72dwTsYtuSvc8VjVc7lINN+xxGi+wQ7gJVm0Q2S+PGBJtxEHN1DNaGgvwS
	woFqqlYaku1PIqxM+u1blzDW4AECRlBGIn/EPMiPwmpOlwAhZvh26GVQrpaRxX7YZGP+v4Is0Au
	RFQJ4klcWifX1aIrL4ItWa5e6etXbBYrw3t8zYpMmW8rOLntCR6WMGxlmjZMenPQNNZ1586S6nR
	FcA1o01fqMtLhOOYuLSCUxf7/eqz4sAh7Xrz3k06KPscqj8GVkT4b2sdNqAFnEdiyhG3sR/t1ze
	GDxk/tcbvzcZpSwxhmu/cA+SE1jUz2rHXtFiOo1PJ5dvCuHmDLfzX3fKHuAHlZ43vKKfmj1kDzW
	ZUI0Itn+aZJ1I3+yyRulWnE8fbjA+Qf1ezQHjuYbc5uK6ne2XWgmG
X-Received: by 2002:a05:6214:21c4:b0:705:1647:6dfa with SMTP id 6a1803df08f44-70d76fb9f38mr578876d6.17.1755628653093;
        Tue, 19 Aug 2025 11:37:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9g5WDnru9g6elHH2WCUnlGhO39LL/afayuPo32Knp3mmA5gZjAJ4tQtVgbmRYy/mExMGg3w==
X-Received: by 2002:a05:6214:21c4:b0:705:1647:6dfa with SMTP id 6a1803df08f44-70d76fb9f38mr578546d6.17.1755628652601;
        Tue, 19 Aug 2025 11:37:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a64d34asm22517461fa.73.2025.08.19.11.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:37:31 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:37:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 2/3] remoteproc: qcom_q6v5: Avoid handling handover twice
Message-ID: <t5j22g5mqunygoj2qcggle5opzi53lofwjd2xen6pfwmd3dwa2@gipoxf3u377e>
References: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
 <20250819-rproc-qcom-q6v5-fixes-v1-2-de92198f23c7@linaro.org>
 <r4kjhua4aakkgni2y4feigk5vvaz73ncetdvegic74lhuadosg@s2yzjlgb65lu>
 <aKSSqXV5FOW27VJo@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKSSqXV5FOW27VJo@linaro.org>
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a4c46e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=RDiawQoRPOseaMlkMMUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: yFZrnOtokQzwklYf0VEvnVttAP36rqU5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX9SAqJZwMKOmv
 7DnE472JtaeQlYHI0jg/HE42lOtopyPiw6vCeH9DvO1SS4rT4fazPqJOvlUWA7SWwuKUm95cEYQ
 Ds5ubnYuQpJ494FD3C3fgfXVZtbXd1ljKtq2ODjdmal3peEFFTCp/DPZkjHz19QPKJ1KVcCTxRW
 if50VT1h65j0VXHlm0eV5cNB6YO59By4nK4hpjma5GW7xp5ksE+Kv6TxLn3H++JIF1pPsGVa5Zx
 cPko+kbzifuxWvVr3yxN/qZKvVgQBfYsVmWYH4JUxeBHP60BQkzWCkwn3kJ0OZdlKDUICnVQKVA
 GGfM94lCwjiFubTEqrBX/O3j+SmXg318Dqo7tMLJd9RwUxAXGFqtbjtYLfL0JzLBWmiFDdlreh6
 oNR69lQ9
X-Proofpoint-GUID: yFZrnOtokQzwklYf0VEvnVttAP36rqU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024

On Tue, Aug 19, 2025 at 05:05:13PM +0200, Stephan Gerhold wrote:
> On Tue, Aug 19, 2025 at 02:41:55PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Aug 19, 2025 at 01:08:03PM +0200, Stephan Gerhold wrote:
> > > A remoteproc could theoretically signal handover twice. This is unexpected
> > 
> > theoretically or practically?
> > 
> 
> You could easily trigger handover again from a custom remoteproc
> firmware by setting the handover state to 0 and then back to 1. However,
> if you find a firmware version doing this, you might want to have a
> serious conversation with the firmware developer. It makes no sense to
> do that. :-)
> 
> In other words, on technical level it is practical. From a conceptual
> point of view it is just theoretical.
> 
> In any case, if it happens, we shouldn't mess up reference counters in
> my opinion (or risk dereferencing invalid pointers etc).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
