Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A9830DD37
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 18:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755628634; cv=none; b=pN+cBqjFpN4lYod6N3IpNd+bdFoGb11kjADnWDKW0SGIqkbVM1SeI4rj1MhlcDdSINXX8r5IEl/dms+IIWPKlFDLCcGsQ+NxUefEhVqiVHu7HQbVjySrVhGtU4160Yy37rJtJbItMDARQ6KE0jv0smFhkLQnNUM2eQeoEltO95Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755628634; c=relaxed/simple;
	bh=vrW0EmPkI4zd+cOzmIRYMTsJL+PuP37DVuXcK02yEyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3Yst/QUFPs/uTfN+lxTMzlegzkNYb0k7DA1o6gMZkJ6hyO8r+4iNr3+noWyJclVas3XKd8eSsdGdavhQT8fIeRZ9FMaW2P2B/mZkA24KyVVyCZ6AsXG+CsShLQ4m5nYNQRGxTMI9Q7OEg5UUjv7sZcTT7Mm8oyexvk8hglUNA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzYMIuO5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzYMIuO5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHiooF007220
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 18:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8zzsSlW+vfcoetmh+aNUXt0n
	PW6Hm6tovpVdqMFTAKg=; b=YzYMIuO5P75hXFa7sLMDAQzgo14DO9mCdkXrao46
	qQJl//f/b5p7Di3PkGHO5npgEiNmOpPmqNa7WN2/KGeKJfNg55WbQK79bWbgnjEF
	lCNAkqCFPc6ZaU4gXV16IEglfmu3M+KwhxjOdlZ6pip2gRpqONewYNdkb6dHbfhl
	tPV/xGX3wlZeo+nbjHAe5OfXsOqStpWi91bE/FUrcG95z6JN8Sj46BsibsX+380R
	D/cCiILzF8vvHgNZ7zerKW/SKiiwzRSCzyf8xYyvW65X1lXJzob1YyLKy5w5Y804
	V0+gWtC9MpCS0YGw495qHGTS4cgmqUhY237FhjzkI1w5bg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj749pkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 18:37:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a928282a3so194825106d6.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 11:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628631; x=1756233431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zzsSlW+vfcoetmh+aNUXt0nPW6Hm6tovpVdqMFTAKg=;
        b=ewtdaDJG/LJHmDfZviZ3c+GtQxYOkZtgnmb3Y3PGUeIiGTutTJjcwFxQ2AboqBVhtY
         qiYVaROTyozneA1h1yjgjKh1K4LYcLJwL3LU2ACOh97CG7tq2SfzZanffxqg3lOjXFmd
         6LiqODhaS9D4Z/E1NJ+fUHRRygu9x/xhYG6ivrihrwoDB70zsNeWgMM6iKotVCCWTeWl
         0wccBYU7bMDm3jO2oZf3w+kpxbtgXlBM8WC74Ot5RFVtkzRioorjX6MlWjVIYyLgf8kt
         hE2qH6N2KecjguUuclkKoDFAtvR20eCeNw3zzLwN5ISs7nJQKJCaDF+0jw8KeD5gkNJO
         BcwA==
X-Forwarded-Encrypted: i=1; AJvYcCWXHKk654HxCD/B55MuGVGYO5IrBq+PnZOmFSBeVPphquZV3ZJi1Hnp8SyPlbRM2dt/Pqt8BBaL2e0ghTz5OKLe@vger.kernel.org
X-Gm-Message-State: AOJu0YyXDgp0ooYUvybExqb73jg0WwAxO2+utBqclbphtt06yvP02v0E
	Q73E95k1ONeekqB/kNKYj2ePbOI+804q3z8Xa+02/jgZK+FRDbdHWJt8OMSkj0iZwFcxtR4tQUo
	zXqcnA7wpCiTC/5YOdx67gl+pA0EHXLGYxCpH4HJK7prnT4c7tYfkFwh3LBvQXXwVuhG0pMJh
X-Gm-Gg: ASbGncsfSYg10+ryJXUd53PjFQcsmb64wdAaHAOD+A5EMlNoCr+SCbsfJN0HMBOfG05
	sKCUm6lLtgNejQKyI1QAmeVZAABMUVUVO3JthGmnnpipiixG49Yw5JGbjnGySwzqzu/BZVuf0D4
	EI9N6huxm56p1HHt6cLjGEptUU3A37XEuRdlcSuJUomoUd2B9QE2PvYXUs8btDbT+pmfYa4p3KA
	4/RKQRaZF1X0lN9qe/bkIUL4tzD/GBWdMz9aUd0NE7iW9axjnsi828SSimoelgUOcZrnIBTLgOw
	/ZsYgn/uQaaqB3gF/GGFVcwXL8dxTpDn+HtIFIJCWXAnlJIoKHzP7435Hf/i52Xqodl/NkteehU
	AnZFk4sGfSJJHEORyjTRxPzqnB5bkk3H1B5+kO008TllfrkF+9oVo
X-Received: by 2002:a05:6214:2526:b0:709:90d2:4628 with SMTP id 6a1803df08f44-70d76f92bf6mr680936d6.19.1755628630767;
        Tue, 19 Aug 2025 11:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/9Jbw5k2A7/yG7vgxGLA4vjWJwQp0tKe2YMtTmRKt/1P68C9GEw3yPXUBXiX/mkaJHk3uRA==
X-Received: by 2002:a05:6214:2526:b0:709:90d2:4628 with SMTP id 6a1803df08f44-70d76f92bf6mr680246d6.19.1755628629913;
        Tue, 19 Aug 2025 11:37:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3ccd7asm2257069e87.82.2025.08.19.11.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:37:09 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:37:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 1/3] remoteproc: qcom_q6v5: Avoid disabling handover IRQ
 twice
Message-ID: <lf37hp2tkiv5xmhc3jrm2rulzureegrixxzptlffvscxbg3yhz@3r7bsvtuehjb>
References: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
 <20250819-rproc-qcom-q6v5-fixes-v1-1-de92198f23c7@linaro.org>
 <czaabkgp3aerp7fntqnpwgilipnum5vmdwwrkem5mugcs7vvd3@q2mwq6ijfbmt>
 <aKSQTc5u5AePWVwj@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKSQTc5u5AePWVwj@linaro.org>
X-Proofpoint-GUID: lnP0jMXc9j6GGcJTbjoJqjKVcM5doj_4
X-Proofpoint-ORIG-GUID: lnP0jMXc9j6GGcJTbjoJqjKVcM5doj_4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX0lGIPDQzyHzy
 L4EUnIBPX1kn5EakeN7Wz2Ayp4VJDZ09oWaWnCXR91rusP8kPzsAhKr9IgDkILLwjO0ww6cbDHc
 Q7B+u/Sn5c/Ht/Y/U0oUh2ZRfQ6MudRBx0A28BALQveNjJt5+bOXPbemFKeJdZnOI6llbiaAeFw
 a10/qxzRyTA1b2AsRs215s59wdTob0+UaD31hCdPIfcKZbUnIe4y738tstruwwuyGJLSTZ5bwWJ
 0s+v9YEOwE0TFI6y2K2assLrcc+vwXTAOq6uvg003bedU58K2EKyc+CsPTGk8D1Izoyw0rx2I/z
 05Q/myc2l+E50OikwYPwIG6c3DPXBcGDdbu1sTGnLrcEnOyur53Px1dwPdLPw8xkYA4ekilEkJl
 kr4XKcY5
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a4c458 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=512bcEdpdAFZAVaU8m8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033

On Tue, Aug 19, 2025 at 04:55:09PM +0200, Stephan Gerhold wrote:
> On Tue, Aug 19, 2025 at 02:44:26PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Aug 19, 2025 at 01:08:02PM +0200, Stephan Gerhold wrote:
> > > enable_irq() and disable_irq() are reference counted, so we must make sure
> > > that each enable_irq() is always paired with a single disable_irq(). If we
> > > call disable_irq() twice followed by just a single enable_irq(), the IRQ
> > > will remain disabled forever.
> > > 
> > > For the error handling path in qcom_q6v5_wait_for_start(), disable_irq()
> > > will end up being called twice, because disable_irq() also happens in
> > > qcom_q6v5_unprepare() when rolling back the call to qcom_q6v5_prepare().
> > > 
> > > Fix this by dropping disable_irq() in qcom_q6v5_wait_for_start(). Since
> > > qcom_q6v5_prepare() is the function that calls enable_irq(), it makes more
> > > sense to have the rollback handled always by qcom_q6v5_unprepare().
> > > 
> > > Fixes: 3b415c8fb263 ("remoteproc: q6v5: Extract common resource handling")
> > 
> > Didn't earlier versions also have the same behaviour?
> > 
> 
> I don't think so. The "extracted common resource handling" came from
> qcom_q6v5_pil.c, but q6v5_start() just had most of this code inline in a
> single function [1]. The handling of enable_irq()/disable_irq() through
> the goto labels looks correct there.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
