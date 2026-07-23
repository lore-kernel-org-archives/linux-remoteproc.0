Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B58360EFA
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823161; cv=none; b=FAbDoyHsmptfxVJXUkz9OOthOLAUzUXS0j84VvoPjX9h2hZZFOE1YfwZFOpb1YvAqmyil6GuahY37zqKjOmEiiQUV0AL3VU6jvZ76Q4bPDTJtdgOEk1xYpK4uG29qD4D0/PpkLZ66TrffbuBtd8dCi4A+d43D0/fjafj8E6kyT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823161; c=relaxed/simple;
	bh=iuVuw5nNY3xBcIFxnlkZp16bG+f+MZhXQhIfG9siLr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TM3sxhVrWSlF1YXLnZpCJR8XXvxJy2oKGnN4zBakg6PaP+214YlcMxsyUFb0YE6qbCIXW5bBGTUP/aFYKAAGPNkDaHsAR6+IjRozVHKeYBHs1gxRpFxjMqZcfEMK58SU5U7HSwg74WaUkuT3DD1LvtROQySqAj9P6N/0ko+4fZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8zLlPtG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7wu0lTb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8zLlPtG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7wu0lTb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvlIr4173040
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 16:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N5lIvTLAOqIy1JagUcHyIiNd
	byPosevcz0sxid9UvJw=; b=G8zLlPtGi4bEDzQya3k0mpA9QXwlQ73Sj25pX24q
	CYknQJv9zys+IvXvNrZxr2jtiXTdrgLk3gmwKQZjfub/1aT81HW/u8b2R2pYUYxB
	jsM6nONYv3TDLyZP4gYhMrAS2kdaqLFZaQbnJaonBCxKbX4DEQ/SUzx3+W4CFd8R
	XHx2M07Az+V+eFqTNJFZhlPBtTkOE9hvxz+LPjZ760oj7FnVMmbfDhRx9fg4A5lG
	ttXWcnbDlZcjXKZh2R4hHwBZzmcwogtTp5Pt1wXIPHPTxrOtCRBFZhOI3HUUhyoK
	dlwJFOi2cv+7Bmjmzo68sJDxf5qZSk+VUpANkCbCMnVpRw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qjd77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 16:12:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so1151313a12.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784823152; x=1785427952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N5lIvTLAOqIy1JagUcHyIiNdbyPosevcz0sxid9UvJw=;
        b=D7wu0lTb2LCgow4gDY3/TXY+VjGlbHq4l3Z3q8aDdUgNgXvM4DLDyzXece04X3iuU0
         cKDbA1LeRux2gP3hEn96Fre32FbR+m+lhp2/lO+0YSY4xl7ffYpjE/enku1H3F9ZR2CN
         CsSQq/Y/jyVy6qQ0cosJrQbfxkFNt8cbLv3BzZGUbM0B2lr9MwraYFTdjznWkL4CIfBc
         kov3Bv6qMFN96TJFd+5CIAH8Gj8dQTd4cayeyMzmjMKhLuOEr9BFL1QS3df0maIHnqdi
         unikSrON2dEsFReXt+nWflaGYeTqEhJl68sm8g5FgMXkEm69+LP6c9D0I3Wiuq+2LEID
         HjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823152; x=1785427952;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5lIvTLAOqIy1JagUcHyIiNdbyPosevcz0sxid9UvJw=;
        b=owhdus/IVXuSmx326groBi//LMqcb5+7bMmRt2DsSP4Mx7/MD9MliSpQBrBboxifUP
         m+e8qw9HepK+B+ed0GDgh2ONku4uj9BtU3x+j67w0Ti/HUQmk66H+tRDeLkAx1nJiYCC
         F2wD2sw5tp+/E4MexSunMj2MVkaG105KKU6ICnWIfX+hbod89KJptXxQFiILpUz8e01y
         7Uj93fiucpLnWQegkiNHDTBr6JdQm+X7Y8j8mPNi6vojK0TgEHQYNL0A4LQhZoU4yugu
         OEpLUmM872ny7lgx0vrpyyT3qGe8tIfp/iVVkc2j1QiJUih4D64dz68ts7OjjTuKmL3n
         E+vw==
X-Forwarded-Encrypted: i=1; AHgh+RrvpyNBDtelmyFD8be58w0MjsZFb3+zhIY2ft93sP1S/X0OEBfkl1TgjvkFttNVY1hh9DKY6mg7J7e0NBDTsbur@vger.kernel.org
X-Gm-Message-State: AOJu0YwY9TS6cbxm8/+l5rLMWQxs3CDxvSs2uzMR4h1YhpyCSHy3cDd4
	trueDCSsUvt8xvOrlVL6kmyMOzBfeUnTRLphYR1bb0IYpzJZyhYY5ysGYRbd+cuAo70yRbjrrIX
	Xsimq9p7ldjFwMGE16wGtccqPTnPbYxgMJhsy0PHkW0O3W7lbhG30ZenGmuM2Rm8CPJRbyM5G
X-Gm-Gg: AR+sD12joE19pNLCXfMYoZW6OZEGfeAnw9nwV3vwlolWKzMRnmHZDFu2lchiuwjBuCP
	rI2ZqSDYzrW+c3RQY7Z8/0cYpbKJWZrsGbRjTH2IESnYocdy3y724bi8AQA+2wq+EHkYF55JNwz
	5QFNob+wQMWMK5G0a88s3Uo/g+Us04FG5YiasqXFUy+oJ712A+9n+gheGUfpdWg6kpnSgZRg0PP
	oRsxYxsRhnacM8soroBZw6u8HcG4ggqIwuVSW7HKoRP1iEknqb/SUMW47fESTkWBYic+SsMDYab
	6TWy8nFsP1u3W1gU+1BbBmoSpY4qp9ET46L9hLlkCvqIT5VjID02csEBZFz9t058cvRE52kQ002
	JO9peukCAqGlDOc5JE4nixIlUR/Q=
X-Received: by 2002:a05:6a20:9f09:b0:3c3:8d4c:668a with SMTP id adf61e73a8af0-3c44b2907e2mr4316628637.75.1784823152325;
        Thu, 23 Jul 2026 09:12:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f09:b0:3c3:8d4c:668a with SMTP id adf61e73a8af0-3c44b2907e2mr4316578637.75.1784823151738;
        Thu, 23 Jul 2026 09:12:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm40221920eec.21.2026.07.23.09.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:12:31 -0700 (PDT)
Date: Thu, 23 Jul 2026 21:42:24 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: Force shutdown during device removal
Message-ID: <20260723161224.zos5boaztqruugry@hu-mojha-hyd.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-3-546dfd5de0e6@oss.qualcomm.com>
 <413bcb02-4823-4c2f-8e0e-c9a40664caf9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <413bcb02-4823-4c2f-8e0e-c9a40664caf9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1OSBTYWx0ZWRfX9pmiSR6ZgW8t
 pElai0N3KcCLoF6MaoLOJYt5ftYTDzGVV9q0DV5qGf0jSal9MT/DhsXZfah0d2D74BNPwofhLiZ
 e7wkkN3JO1genMRJ26W5pE69pSBxFDg=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a623d71 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NXdBlM5ysJzwQ1gS-hcA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: gJjTL11mlopH34HWtPENmA6yaiBu1bxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1OSBTYWx0ZWRfX7tfDn/yrLrkd
 qHBT4z/Dia27TuYuMIJrEhUvraq85IOjLHS7xK3NNW6l5lMy58PwCixGFqRMjh1NNgO6M9Wd+p1
 5zeE0UZdNBF7UPw01z/4sVHutNJvmfB4Ylz7PH+kPK+w+TNg8yxhU4omwlj352mHpOOITOmRNeW
 unGzSdKfdT8Djz9nwNGAzFn0phsYa07rVO1ONbFCp540WKBB28p/G7xuFuDFWbyd6+haLevzSN1
 pndQrVnNgvB/8wEkACnTZMzjDbpVphxj4R6X2nsy6ONAS0RukYAJYfxsaZr6EzW2l1c6kZxb6oa
 OjJGmj2tGiamsJRHjPiyloX/5Jm9UmiFg7l4xBRwZjYM/rJ8riAlA/luoVIp5iiRaIht+2cSHaz
 rgfed3kD8nmfhxZS0Fk7wt6zUMrYsQ6kZ2Dg7Pd4Qg2JWJwugagYKY6G12alXxYyovZvqMev0ua
 D7wYz6khtFk/4TxIDWw==
X-Proofpoint-ORIG-GUID: gJjTL11mlopH34HWtPENmA6yaiBu1bxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230159

On Thu, Jul 23, 2026 at 12:54:58PM +0200, Konrad Dybcio wrote:
> On 7/23/26 5:52 AM, Bjorn Andersson wrote:
> > rproc_del() is subjected to the reference counted shutdown path, as such
> > a remoteproc with more than one reference will be left running as its
> > resources are released underneath it.
> > 
> > Refactor the shutdown path such that the reference count value is
> > ignored when called from rproc_del().
> > 
> > Assisted-by: OpenCode:GPT-5.5
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static int __rproc_shutdown(struct rproc *rproc, bool force)
> >  {
> >  	struct device *dev = &rproc->dev;
> >  	bool crashed;
> > @@ -2029,9 +2008,10 @@ int rproc_shutdown(struct rproc *rproc)
> >  	}
> >  	crashed = rproc->state == RPROC_CRASHED;
> >  
> > -	/* if the remote proc is still needed, bail out */
> > -	if (!atomic_dec_and_test(&rproc->power))
> > +	if (!atomic_dec_and_test(&rproc->power) && !force) {
> > +		/* The remote processor is still needed by another user. */
> >  		goto out;
> > +	}
> 
> GPT makes some unclear suggestions, effectively saying that rproc_shutdown(),
> unlike other paths, seems not to first check whether the rproc is deleting
> if the shutdown isn't forced. I think it's a valid concern.

Is it not indirectly the same thing: `rproc_del()` -> `__rproc_shutdown()`,
meaning `->deleting` is already set?

Or are you saying it is better to call `__rproc_shutdown(rproc,
rproc->deleting)`?
-- 
-Mukesh Ojha
