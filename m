Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8FB3F1ACF
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801399; cv=none; b=HzYFDrlAQJMpqyp6E3S86gE6OMs4xWM+Io4icYNn8XvK3DnW6t2ppWgbYBaGAxidePELemAPhsPGscFt9jojqsi0/LGfyAoQKIME6DV8QwDZCEA41HM61XvzRkeL6HTXoFKwPDMuloNL1Wjy4+Mu575LxF8OZ0Lz+RFpDA2QRWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801399; c=relaxed/simple;
	bh=Uhpw/sOGbPgyk6zHgw0gj4dANVenbbfQw/w2YbnKZbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+CvPhkp2fynoKZWu5r3ie+JOxtdZxw/gHaB48RK4+GtDSptHAPG4pfL1V3T6ByDzX0CdA4HX3IZ/FeYYonwlbD2EOIqpWu3YvLnVmgcXB5x/Pl06vHxK78iJui7VKUk1WcNjyS8y9eGdsK4Kjf2cTGmetYoNzEJg1ocnhh96+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIBZYsQY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOIUCB81; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIBZYsQY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fOIUCB81"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qiXc3387948
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 10:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZgAG5bdkbs/HZTriNmw/0laeMZHWbWmUNNNMH2lX+w4=; b=fIBZYsQYBUCrGO4T
	yLsgvxZtN2YOfj/xkEskqj4Vc5nQfJ0t5ejvLQ2kdDIuebx2xtPBmjWptcj1n8WD
	Amu4iXaUVOnGQaPBBgMT/BF27sCnNhqeC6mvm5ODmhiivZ6+jh4vjEJO3TLNbs2/
	rewUjKhrlcl35i+YkKNsjl3/8K2wWN3lQpQ+aLSV1rHVN5XrJ+D/OG6hing7l75M
	KIyb1kwOdID5pA+Ly1s6nSYcOXqmaL+ptxSJlU2CrndBy+r1CSZl0BjXmwoD1mN+
	eqh1+EBIarj8hsxJ94Fhf9/fEXkDF1mBl/VwthYOSE91XSmtpVdNEl9eJTMmBzS7
	KPoaZg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275kjef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 10:09:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe75b7dbso1977591cf.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784801396; x=1785406196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgAG5bdkbs/HZTriNmw/0laeMZHWbWmUNNNMH2lX+w4=;
        b=fOIUCB81U3apDcW2Q9BeWr89913RWN0HLxCGnWKppHowA79u1g60LWwAKb/Zazbu4p
         G7SarLcWTF2biq9mBhtfckaIadIYZQJ+7MmOeFa65ix3nKsKtMb7XMQ6npDqFqxZFLtQ
         /1qaNVkrgFksp0AtqErPcUsROk/W7FgewT+tmnJGf0GjAVOuZhEYC5CHWQ8AuboayiN9
         qUsxHmp7uSCt36s+cIj5Xy/KKNWRjsHa4jGtevDDaEnDMeL06beRiu+rHeZDqJgYtHD4
         WvhFG2r2Y/x6W04ywX14kpn5RlodOqAD431TY5W55Mdpr+Lk7LX85OMjDbbGnM5Qr6a7
         /PQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801396; x=1785406196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgAG5bdkbs/HZTriNmw/0laeMZHWbWmUNNNMH2lX+w4=;
        b=NxVbGnoHDGIVay6+jx2l/OoF5bm21+ekvDE28o67bukeubr8hu77tFF9d3Im3Tv1si
         hmaLfG1I09vXCUJTo7P4mje901t6Z40XdBftO0tZZWNBkgPxBmP/ZQvXhJDHlHqxCPsv
         5trFKw8UmcyWjmIGf3sXuUuD/O8xiof9pWCS3ckg1LazKirpx7zWpp8yveDsjtR6OKmq
         f1kEQi59UyQHsmNtRUQmWvgRn7mZiwJ44DI8lyilDA1BQZN4MnX5S2eZcF05/nni/HZd
         1YXs5tk2wLzMfqfSyezXiS5AS8a81+eTEajyKhOtZ7Vv2xJnfVnzvKutCLQK8V+2avwO
         8U8A==
X-Forwarded-Encrypted: i=1; AHgh+Ro+Zo1UxIPyAXbeoN0AwdtKfe5rd4iLT93559tLzIlx93YVO6mw99eCNA4Q3e8aYKVVeDRGWwH7GcY/g18kPGK/@vger.kernel.org
X-Gm-Message-State: AOJu0YzeIaal/DGvGbFPC8KmO7fHlNGYF8RIBk9gvXFOp/dA2yNlh6ux
	3bfcRJTuVYdBO/mIOhmRST1XQ6JWGaPyZLamla1y6ESkNxZrZLEvNKi/1hu50oDWqSJcDMxf0Nj
	W4vw97zU8w75QrYmyXfLbAHWeP3jK2vm1pja49dE36WUJUtN2pWpAREMCsv3UABPXrEYx4X4S
X-Gm-Gg: AR+sD10YTa5UNS5dWeVInvc31nAG/rXIODPkkh9hJ5d2ZXaJ0i0jA9BNhGZRIVF/cip
	AlogaIvNtoTqofaoFqlFESaLxqbYdtUbfQZ8LFe9Qv47K7IPYVVjTaOQKCtthaHoFP5c9BOT74W
	CgJbZdeFG0sevjHsivKwC2E0kOjvWBkIG8I8LjErvaWwk+yzSMYnPwH8a1LMW5iv2/hhBqviwYJ
	UZ5UoOvhcoEvOMJwGlf13uohTHMg953ERo1kG12LZUJMMMmkPuBQX/UHqNNDevJK7br1IrJl46G
	Rn+PVY5bLKLwSUzTl5+FUyAOn6maB/PbbdiH2Hov6OThPxeZFlT/znuaR3zY1JTsGi/5V8l2fEb
	UqmBYPswGeoVCv4/7bPKTDyOG
X-Received: by 2002:a05:622a:a9c7:20b0:528:1a5e:8c9d with SMTP id d75a77b69052e-5283dfe25f5mr11796441cf.8.1784801395796;
        Thu, 23 Jul 2026 03:09:55 -0700 (PDT)
X-Received: by 2002:a05:622a:a9c7:20b0:528:1a5e:8c9d with SMTP id d75a77b69052e-5283dfe25f5mr11796281cf.8.1784801395335;
        Thu, 23 Jul 2026 03:09:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34b9b064sm2091360a12.11.2026.07.23.03.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 03:09:54 -0700 (PDT)
Message-ID: <fffb231d-32a4-482d-91d1-b6932d16de59@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 12:09:52 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] remoteproc: Prevent crash handling to race with
 rproc_del()
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a61e874 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=MqoP1CXxSDz6cHBbW3oA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5OSBTYWx0ZWRfX5+HQUZxsBz2f
 hHPkS6aJT6pHmuocj9Kq9xC++X2kYAT2D4MR6xZA1bLhWDtUpoDtBgg7GZ3EBudqW8nlwS/mKRC
 WE7xiPtykd3nD6mc3iP0lKxhT8kfyHE=
X-Proofpoint-GUID: wvdN5LUb2fvmyGoUaAnsrpByq3FUTexR
X-Proofpoint-ORIG-GUID: wvdN5LUb2fvmyGoUaAnsrpByq3FUTexR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5OSBTYWx0ZWRfX3650ra5ejazN
 W5R3SkE+XKXw7HKXCmC5sYJNHr7+yEG/6vai12Lm86DlE3CEgDdLo6hUVWFkNiZAm2zRHr6TPTx
 Mf/0XHqhIibXh1dEFEu+tXpGcY8EY5lmBEzdoO72TXvtC+4FOPbpsYtEKj5S45Pvedw7DNubkza
 JPNn64Cgrv2iEpi3qTpci/NZ9EAenq+W4EZ/E1oMwjo5gMMrNmRPAtJPnk7nfFeX0N4D0PHQF9U
 L8hDo8525tIG0yb4pGpqau27hgjooS9GVHpXqlbsLtXqwUcfnLHQw5hssEvv18BFQYesZp2y7M0
 rtfG3C9GnS75NPLMuJ0Tc2oKDHiv3w8J7Zb7YP0Bc34zvt1muCsNBa3ZQgMHbhGjoPceRZPiAHN
 JxheV0lKaz3BtKmenzxxwRhwJO1s/8fuxhPDZSES9/xOBACmwAtsD6my+a8zCHBL/xy/DBtecwv
 nhcx+1PSLLVgOCXUciQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230099

On 7/23/26 5:52 AM, Bjorn Andersson wrote:
> There's no synchronization between rproc_crash_handler_work() and
> rproc_del(), as such it's possible for a driver to be removed while
> crash-handler work is scheduled, or even executing - resulting in
> use-after-free issues.

[...]

> +	spin_lock_irqsave(&rproc->crash_handler_lock, flags);
> +	if (READ_ONCE(rproc->deleting)) {
> +		spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> +		return;
> +	}
> +
>  	/* Prevent suspend while the remoteproc is being recovered */
>  	pm_stay_awake(rproc->dev.parent);
> +	queue_work(rproc_recovery_wq, &rproc->crash_handler);
> +	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
>  
>  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>  		rproc->name, rproc_crash_to_string(type));

GPT reported that the rproc may be gone/deleting at the time of
this print since it's outside the lock, so it's not a given that
rproc->dev and rproc->name are valid (although the window is pretty
slim..)

Konrad
