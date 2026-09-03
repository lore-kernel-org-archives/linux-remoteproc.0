Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526763E51D2
	for <linux-remoteproc@vger.kernel.org>; Thu,  3 Sep 2026 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427505; cv=none; b=XT9EmkVQGJ7b2hhXfmHRYt0NFxRVDqwXLgm+/H2A/UJ9uDONnTkGk+bhP+QjVZZVjob3Tc3j+L6lQvNxq7A99FcCxwZX2Nr/kDCmU3GyrbBob1NRWzWRFZOmAyHWbYOx2agEn0WLaBcDMj9I9D5ZFAjmb3l9cMEz/pgOtimJBKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427505; c=relaxed/simple;
	bh=RiRPKZ4Osm1Mw4H8A9BJtRFmrn18N3a1wk0pyf7knds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MIPos6oZrgEVNpK8hxhXSu+10Q0NxCc934Y/548UT1Nu15RGozPg3yJBG8BocaPTWibuA5wQTm3xSg51Zd4LcVoVK+KgWUyivdsUFHEdi3jgzXR2RKe7IIAGuQU3mwxHnoRGpkW4/LUMg+DxBlmaS0lw+2z7M/PgTjPvwI8CpQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRG+5lNP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtKS4M7w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRG+5lNP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtKS4M7w"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392UJS4079001
	for <linux-remoteproc@vger.kernel.org>; Thu, 3 Sep 2026 09:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p2zs+3Jz7pX/zIdzWNa3k21r
	KY8zg0lGnI8endphEcg=; b=GRG+5lNPD+iaZtxwT0IRTdU6vyDjHfl3ZZ1hFL6J
	Hp8EDzcKTqVa/usHgo9Oy68mlPX4A8tuxR5JbGtIiKYU/Uz48+hj0NMEKVW1kXkj
	Z3qFbUkat0qD54DdjrAlrDUQ2kqsOpz4eoUqHdB1nQN4aExNddWZpcqIDindWlVn
	+kADSMx+myX9qdghobH7Kb401GSZnSnOejdbnX7Ln0p55M1KrASaheTj9UY9lcut
	QwLxOX7E3hCLO9/YyOOTRFxizI/zfs7oIeQ8m/YTXJfOu/hss5Ozb9mx22121kcF
	xt0LACAbXfC4Nq4mVA7XVSNoO6w6/7S7qO23G6ktewselQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdv6dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 09:25:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903982af1so550916685a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427501; x=1789032301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p2zs+3Jz7pX/zIdzWNa3k21rKY8zg0lGnI8endphEcg=;
        b=YtKS4M7wUe358OuGfBcaHqPXqKnhmEH6CodV6nfeiloAH1Ax8CYWnjG6Oq/AFoLjAw
         jNNiRhMnJ9c+S7I7BijIVHw2X8p0Mt0RrEuPzq5JCTE7Ig4gwL6Sy2uhjiJvoqgG8Ix8
         jbt04U5bs7SW6T6z46ATc6vVSja+4jbnUmdDDSAWDEMMht95R5lvC/QG3sYxvapzAaa7
         b+RmoH/G+PzuhNDWzimvJXQes+L/VeTVpE3R/mruu0a8rgtcrOYzD6ScsOpsPlyZA3y2
         DMxz43pce85UisXhQnsx4cakIijOQbSNGxDRHF4nj5hRXNE4wu+j3R2zOCgJ8kl3EK5U
         jijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427501; x=1789032301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2zs+3Jz7pX/zIdzWNa3k21rKY8zg0lGnI8endphEcg=;
        b=D9dpb/VCw8hNEytKs/RirUS1hi5RPPT7mykDWgmG1r0XdEhmpn2n4L9VIk/USYo2R+
         q8o7mLdACflvnRkYA+v5jbE3pFVs4xzHe9gaeiVyyP3eU4uJHwzgLnNniApaboXiDHrT
         gQ4yywAoewZmTee0AkDxh6Cbch3Hy1TV8MBMndv5ABYH1AtiCYyrlLhwOyZD0DbSPD1W
         yrPPfy81u+ILDjPCLvzCvROULvNdhJul2uNuAzOFXF5j3zTXzgXBRX2F041j93ivC8qm
         JgSTXuX1hiQDGfVwapr4eIKYsDlLqSJ8fIUaPnjQ3VY8PMrfkvDrWhhIf57PKI6bGhgb
         OKIA==
X-Forwarded-Encrypted: i=1; AKwUvBzLZ9H/u7JMhSMUkd5eLY7sjCzqz7MdeX41LBcwX9Mieps45ynx8fBnccfz59weGCiLDwewio1Hmx0MVgPtAnML@vger.kernel.org
X-Gm-Message-State: AFuF++nkZTk4H+4hbX4ASQt4qSvbMbFoJx80azFM01iLNAR4xV6PyZg1
	7f26MHungHHW7AXeB8H88veK9qBmbksr4ad/bqhyOXi2jtXyiHAPXGMoHJ34AmO0Uecnd/95eqy
	jpsAdYssQI22hQtvLOTHSsGFxhM/lrJpjwlgqUdpXUR6vGEp9eberkgULZAaZyjfgHfZZnMO4
X-Gm-Gg: AYBFou0pY426rgJFnLDWJH0GTkSXB95F+v6WOy5/f1a/nyY2g4tiZHSBfJRZ0GdUqny
	yZcf08JPGQRYnaCUVg+Gmn2v1xN2r2GMH0vCFQV9YuKkt/daha8M5IZBNhtBpczm/SdzxrWnONu
	GfD0o/HvzDZYXIrTNZByKDNTzHbRwD98Z1977AYVSeeEu/nIznEYKQT92t5IXgFmdmHa7q8GweY
	rGsossBUsCArsy6pmh4gO2kpYliy/d9zyDwUg9gUv/wGMorGx4iyDqoHU4Irsa+MqU2rCRxq0V1
	7iADN+tZfP7OHRCU3jP+/uxijBV4m/1CujtnkjhTVKh9QVTkLT/OiJZr2bTbRidXmFxId2RGOK1
	VVEI/NJccu34/pQ==
X-Received: by 2002:a05:620a:172a:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-93960f15d45mr1244546185a.21.1788427501248;
        Thu, 03 Sep 2026 02:25:01 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-93960f15d45mr1244541785a.21.1788427500797;
        Thu, 03 Sep 2026 02:25:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80798sm11791479f8f.13.2026.09.03.02.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:24:59 -0700 (PDT)
Date: Thu, 3 Sep 2026 12:24:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] remoteproc: qcom_q6v5_pas: add per-PD proxy
 performance states for Hawi CDSP
Message-ID: <yr3a5y2m3tz65nag45fgt5urdshpxysvopp66chwcjn7l5d5tl@kmvnvtexyhvl>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
 <20260902204334.2061226-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902204334.2061226-4-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a993ced cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=a2r7pnXXQew0X-Rri2cA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Re902fzc3zXfoLdB3N6NOxqRXVpHOImE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXzhNMMOEuQFCL
 ui8nQYL2MC8ewU09K1JS2SS986nd8F+nfzQF+Yqdh411xTrnP3nR/NiqctFv5Ha+NaiNBqygn2R
 tIGZszshAp0mgdLHCpSW0lP65feweAELLodIs+jW2awV1Sdu2UO9IQinAxWOBsPrTUiUcVJMnMX
 4XkwO8tZnF3m1vLd1ELca4fHQayK7yGd3JIme9etBGAy2TKVOlEkjhhe61ACZYz5kTvhPX9F66P
 01Qsmk8scCnTNQi2YBme0a3qRmmT/OXQd7JwBggLLu38YFh78q5FwEZVO6qOO2PHXp/aBfGbdMw
 p9MFHb94gHj2enqls22Uz/SWp8NLjJh2yFIr1xxHc5xXtXN22r7RefGUrAu3vy5FY2e5McUDO54
 Yiknu0ST75oVlPV+tg0DLEwwtO8GZKbdgLz48gaDIJXcYJmQdg2lgupVZXWyq7lzCNYN5nwd5qr
 hAobLpm1WYg5L6VDK/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX71KDdDTW/qM0
 8eMgZy4HaKnIu9EY4124GvDSvhoVdFYyjpaJUn3ZMQp6UbTGHf66OE9SbmtgzKH5qGIa+hUFxod
 3O95YtoCFwZNrKSytoMprhnmppibJ5I=
X-Proofpoint-ORIG-GUID: Re902fzc3zXfoLdB3N6NOxqRXVpHOImE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030080

On 26-09-03 02:13:34, Mukesh Ojha wrote:
> The proxy power domain enable path requests INT_MAX performance
> state for every proxy PD. On Hawi, the NSP proxy power domain's
> RPMH power domain has no OPP at INT_MAX, while CX and MXC accept
> INT_MAX, mapping to their maximum supported level.
> 
> Introduce a proxy_pd_performance_states array in qcom_pas_data
> to allow per-PD RPMH levels to be declared explicitly. Platforms
> that omit this field retain the existing INT_MAX behaviour.
> 
> Add Hawi CDSP remoteproc support with the following proxy PD
> performance states:
> 
>   CX:  RPMH_REGULATOR_LEVEL_TURBO
>   MXC: RPMH_REGULATOR_LEVEL_TURBO
>   NSP: RPMH_REGULATOR_LEVEL_NOM
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
