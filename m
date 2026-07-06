Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E367374A0E
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 16:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356836; cv=none; b=i+bkHxwCLCDpbcOvgJs8ClMIgMkpDwAJs9JTuWtw4HjV69yLgNQBIw4/1rNZN+7xspys9XFOleyl4iv2bxk8LhqqXXAd2vVahLUJhmBeU2wwZIS4pFDrMTApzSbK5riB3VVwNr8yP58nHpykycliUILjuu/EYel97DcOts9Fcmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356836; c=relaxed/simple;
	bh=dnpu0R/fSpmvEPD4L/8wrbkOZ/dKR4ml/eonMgAgoxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lF1WLGKkkzcL3sEive9dZLnehTiJ+CP70tH4GGIHwr4XRVU4x0cPumo1C2Gm6hbWGc5vyTQBFVoTMRu+5+GIc+RQPx+r8BsRVHl6N/P0AOY2pDT2l+YeYMuHoDjxiVm7CtM70RtvIyVkGfXPSANp0KBMZPBzsuofX8yBAL2xo8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXPwd6zl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+L/UE7C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXPwd6zl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+L/UE7C"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FshrR1050572
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 16:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jdesGLrzqRFvK6uMhNgG5Rmp
	hukyOt5V1tRBckTS4no=; b=cXPwd6zlfVmw6Hg9q0l5C7RijywaZCnQNnysMEt9
	VeV0zoMMI6+7jXmN3alspNPjrFVbFdUS0tUSTcfY15slX4/j8Kzew2tMMEwXFl10
	cE9qf7FuNbhUKaCfKpFO4eTcGZUUNHv1J62uscnlJ3GgzKMOA2+k4xqWmydfMSby
	ZF9c+ZhimPVjg8om5o4xm4RNyM4xC73CgLKh8d94tKatRZzj7jGs/xXqKb1eVAk8
	GfD5cx3rCVez3CLS4+HWq1C05Kh4ooWpYz7bWxXwfcpDn2Bz0JX+rgpLz1krw6Or
	8HC6s2q8Jp60/oI2/nLs891UEOr/ZNa+XRoa1gYXQUUdvA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw0a6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 16:53:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8620ee0971so3767341a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 09:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783356834; x=1783961634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jdesGLrzqRFvK6uMhNgG5RmphukyOt5V1tRBckTS4no=;
        b=R+L/UE7CiKYpJRTkDinxNysT0CQ3A+qJ2mDhk6uB8DUPk0yeoufaMGWrMGnqCWq+sL
         Pf94TnsShs4hK70C2KO+IY7fLyt1prozNse5I8tCXhxAG3d5enarv5W8MddnUURdnC8R
         c1BpQPG6mMCRwowK+DGkb0uSjvStaAXiSPcKZ7iPUcn/eWIr2VJwkL/kp/z71iM0kaAF
         GLqpnC6v7tlvrjAx+IWQobNl/0iyJlIVFLp7jXgfxwlnnp523xG7umU/rUkG/Md1u0D+
         3HRx8pCReh1OvfzFIAb3UedURnd7HQ/tZyb5NURDVxAd2TI/MKA7ND5N9+WMc3d0pCe4
         OQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783356834; x=1783961634;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdesGLrzqRFvK6uMhNgG5RmphukyOt5V1tRBckTS4no=;
        b=XUKv8OdGXW1R/2Z93kL6uVvhKWbgcOEJ6h/zb7E18deD1Fwa5Vf9y+hYMXJL5UUQca
         1Oiq7/d83i+w4m7xDtZUbJItmqnWf1O19dLoZpmZo3ubI6PTWxaliLgbqABULOjVNcAn
         3/fUW1yZ//fEblqdNAPxd2pdrkUUzmFq3nQgt/ZepeuAxn0uBiaHSxU7xVE6T15JJSgj
         1QgFNXTCkhz5MRypnhP0EZE0dq4LGNb3Kf2TUpJDY7f3tX8QDD9au842VQ5OTiMTb0ur
         tODh9CsgVvpnNCQ2tj0adj3JPNri7QfzmmgDmvKaV2K0DacN63SSrXkqrpQgQL+pH1bB
         01Og==
X-Forwarded-Encrypted: i=1; AHgh+RpONDvRlXqhSWDL6eYo3RQgMsRaU4i1ekAEwPRmtQ5GGyt69EOqhO167vlepbI3eH1/ctqRxiyrheFyjLnI7tdS@vger.kernel.org
X-Gm-Message-State: AOJu0YxnQjFO/1OTo9RDi80rXVY131vCUG1ylIdzRcJOZLiB/FYov0Hm
	YE3dc5LL3gFjUH55Xs0E317TPW52AXYiEhWm0TGAYVuRYGsoyRaKcgtVKh/u5WyAgtnXwnKtFnU
	Atmaf1qLe9hhY4B0NSUykINt2W3iFd3c5ENnjAMjSDLkrjQDMeCw9NRuKbaPtwVG09icMVSyt
X-Gm-Gg: AfdE7cmYnkpf5xHXzcAbeXhQMmSdyz0FLMVPVek4R1Wg+xq67fwL129zPW+LaIsB7w8
	JoO92wa7wmz46Mc+9ofAKYrpeWKdJk7Mcz3VeTVc8eYn4rbZxeab2t7EbXt/HFWdYwTBI+gP9Ab
	WmtBjHcPmW7c9lhzmfv/SSJ4AZ9EP2s/0uH1ra1DGD3k80zRBXKInC37sZKPzmJKVtOIuaMiTYT
	+bOiOo2R4WYJmFrpILQJdo8kbJovYH9GjVieVI9UY9a/hJzmcQi5kHFCibuwG5nbTMUowEUpvlY
	AvXEN+9G3XLpPsqOwWY+cGn7ffyzPHHDUayd8afsOE3IRcdV826c/ovZP9Hzw6y1ql/gPzCMfqE
	Uvyq7CbtUTib3wwlcklY2S5kED56aUX3SEAQ25Q==
X-Received: by 2002:a05:6a20:3282:b0:3b4:6f7e:d0f9 with SMTP id adf61e73a8af0-3c08ec71673mr1732945637.3.1783356834055;
        Mon, 06 Jul 2026 09:53:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:3282:b0:3b4:6f7e:d0f9 with SMTP id adf61e73a8af0-3c08ec71673mr1732896637.3.1783356833486;
        Mon, 06 Jul 2026 09:53:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm24317500eec.15.2026.07.06.09.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:53:53 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:23:47 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Make ssctl_id
 configurable per platform
Message-ID: <20260706165347.zslrvhdyginswej6@hu-mojha-hyd.qualcomm.com>
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
 <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-1-f59e728af621@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-1-f59e728af621@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfXxBBR2laIulFv
 AZOoQttrR8r8nsa5wfUOtxk/TEMy19xSBY+EMHckIB1i8hAaTNmRC7b9FZbiwqKqHLuOR6lxVHv
 bElOdBqM8AwkqgHUFI42rH6xl3aIr3o=
X-Proofpoint-ORIG-GUID: dCvvprGp3p9oWl9OyxvHVjiGvl-K326L
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4bdda2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bjVS6o9MGAhJDIbh6jUA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX+R4ZviyOJ6k2
 PEsQ36hhr9lau4SDqtFuCVse/fcJRgZxrxTSnEAjfQfCGehbBO4FWbYWMyvjW2+OV6CBLU6v5uv
 qOLSLIeXewDM3/POtCQav6jodnsTqE/OCFMU75TtKGdCjhaMjtrUlPfi9hryizL+QegOF9QEfZ0
 EGXv5YSonG1G2C9acIZT1toQWvoX1QA9fLbbvqEMUgbelNuanFVrVFDc45n6C9hv94UkxqV+C9Q
 HaBuxS2JQRP2FyQ59BEfXKGpkoVEZ7Vv9cBIOQ/PSYLxcjOmT+lAXdH6iqUFkWMnnhdRf8AsvIy
 sXkTxiNSfGw2kFe26hIXD93EuSjDKH56MSsUkHch23+E1lqI7ZpudNjXni8CnukLDBnJCtBflxq
 ii1JooMSVI5kTCv6sG1w3So/4fv73tEr+hyGFqD3Mcq7JRs3L/1/dkhxyfWYJv/MMHr3ddKEgdK
 IR1aZdIlqEw3OQHq3Wg==
X-Proofpoint-GUID: dCvvprGp3p9oWl9OyxvHVjiGvl-K326L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170

On Mon, Jul 06, 2026 at 05:37:16PM +0200, Stephan Gerhold wrote:
> Currently, qcom_q6v5_mss hardcodes 0x12 as the instance ID for the
> subsystem control (ssctl) QMI service. However, some platforms (e.g.
> MDM9607) provide the service with a different instance ID (0x22).
> 
> Make it possible to override the ssctl_id per platform by adding it to the
> platform-specific rproc_hexagon_res struct. The same pattern also exists
> already inside qcom_q6v5_pas.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Yes, 0x22 is for all the standalone solution while 0x12 for
integrated SoC.


Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
