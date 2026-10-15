Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C604E56C2
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059359; cv=none; b=XzupBbkpZy+FM3y/LWnHvJ+X61cHMOJ2SE0AKrg+mAHRZk8KRf6MZA9Hekv28lG77w0S42jlXfhlMdGdTJtJkGFOCTGILyQE+SWuNvaRjKCIFY+j5rc2kfjKWnqMvL3b+Bi/l527bGUYKZ6FECZpZDKK6B3OAsEsGhZcgv/u+qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059359; c=relaxed/simple;
	bh=shdhjPkvDR57kNHeQ4WOOkF93PcSzZ6NOlgi8C/r/gQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PEqcuRE+lmQB/Kk8mHGmc7EKDqlpoTprjBcysCkcKP7zmmJWSH/ckRv2+m27T2IYtqAyZxgUs39Bdaj/BFJXXIRmNaaLuBozT9WPNcNoz+Szdbqi2IUUT2s6ujg5PRX+yThgiSZL27u8/xD3RmdUvUxP2nVSHY26djBUYue9iGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSJ3TO7c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8c6ZUBd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSJ3TO7c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8c6ZUBd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSbh2809287
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 10:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	shdhjPkvDR57kNHeQ4WOOkF93PcSzZ6NOlgi8C/r/gQ=; b=iSJ3TO7ckDsZiDha
	vTyozSoJSqmBjxWVultHkFGd8ojNNXSzxnN+tY6pEBDnWMWwiJ1A0YP2CgA4hcpo
	xeT1kAQU4wwKk3dyOvNN8I2U/VqYyY0ooEdJJ0oGstvIcruijG3B+r/HuciccY9v
	OLKDFocGjHXAderIRhlalYRIRJkxWCZ+wxekt4FhoTc/6+8aCXw4w3hPE1Izps0B
	fVdWILymgBZTuH9Up9dHLobMN1L1ja4ak1WKAY/dLSDPWSwzmnabCU6gZIuzeh0u
	MB18l7+H7ZTABqnXAl71uO4FFZQe/mC/3cijRwlhTsSjsS/TQff8A8hH0MugTNM4
	AiKJSA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54t1h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 10:15:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106bb33cdfso13476586d6.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 03:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059356; x=1792664156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shdhjPkvDR57kNHeQ4WOOkF93PcSzZ6NOlgi8C/r/gQ=;
        b=J8c6ZUBd/N2XEsv8lya2PICzxrNVoImFYNqerGKiIlYugQbVpq2KOZk8pvRCxjskjp
         lKpTJwZkz0ZMS3ge3Og0Tb0X+QULs3bxrAlvWOApvvwY2PBl6rK/Yhz/NVqes6rslY70
         PxMA29ZpGs5eFTq7Fa4nxKMTCEjxTBp2nrcsmMDh6GgixInQxYziz39R6Bag4UJqHLJ6
         qfh2nk2fu0jOvxjDR66Uuos6Hw4OFFJotQ30Y0sJabHlJ12ugQRpVDMpI+1O556al2R1
         PJrN/wjNlLdapHi8fDJcRKGhGD8HdNmBeVTiYqbBpIrq1QVe+UduJyi3T2Tj2IVF2AxN
         4rSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059356; x=1792664156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shdhjPkvDR57kNHeQ4WOOkF93PcSzZ6NOlgi8C/r/gQ=;
        b=eWz01qYRH0TrB4fIeB/7MLewhu4Qoo9In/dCG/8wXddMp+WCVJBdj7e0KGouY9iWLZ
         U4MFKbWxQtRmHFQ+6Qeoop77wZH8AA6Pplvf7cnebMbYGC7pCBvGlI3ifpoDVfYcr7dN
         vStC/ptdM6DEW/3enJExxr6vSsNZjdFR7lCUvtoLUjbMi92eS0pe5HJdxFV7l96fdZ/C
         isxMv1+TbTxX8xo6a1f49TNOVcxMcrpvmgbcDSyGC6+1FNfjcbjQmT4QYyP+EQbg3ww4
         ahv5DXVp7TktIvE7xxOmn5zOrgA6lzR9D6G7+dZ5UuZF8ZDk3P64RmjhAUuHdiVcIUD/
         zWXg==
X-Forwarded-Encrypted: i=1; AKwUvBwgnncgsV72Dcb4TbU3pJNsFeJVYLG2mewBoQSKiq9zbYXTwIShOM6zsfTv8s54QkJ80l8vCnMvJzze4c6IEQ5J@vger.kernel.org
X-Gm-Message-State: AFq9FYIVz3hfBFprumwd1ezyak4+DORIS8zButH+MAR37eQAqJYggcui
	dDb5xW18p7LhWCcGL/XCmDSg1WJjTrF9Zxj9Mjrh+1LdXuroZVOckWsELwC2I0DK0ldHoSXr9ei
	XDqrCKjKdZA6uKG1o7KaI6iXJkWpe7tJZkUXp4Z/+zx/SazAhsNPXpb3w9LJsRdsKURws4PLjQK
	V00us0
X-Gm-Gg: AYBFou0EQwM/bGtAI7AJbFhrzLt/QYiwIUSnzGHpPN2E6VwoU7Uthd3N+cnVV8DmRdI
	vlTy6+cNaEQpQ9i6lRB0Jd5BfeDaodpg1FXQ3p9prOGgQZXCXwdS5cY+PTBJiJSgJQQL3LTyAjl
	k/SCRizIrxAhtNoRI/94kx/4cjpWw84FJqpvghKuQyixLsvZo7radCsrRG7UWZwh5k2wYKg5esc
	5zrtcwVFlPBevBf3P/1iuxDMO5lq2WalyoI7EN12COXNFpC/CSvhHWDuZSPLBff8z5jufEHIfvW
	Uf+KnVYDIgs1EaPlkOeShOf2Xb2oCdaR3WfF85YxxAZghkoeRrf5gWhpD2EdO2fO3ak1prLZUGF
	TERZT+tMuig062NIHTBd+Rg==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3300567585a.4.1792059355980;
        Thu, 15 Oct 2026 03:15:55 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3300565185a.4.1792059355485;
        Thu, 15 Oct 2026 03:15:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6beaf65sm106831266b.3.2026.10.15.03.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:15:54 -0700 (PDT)
Message-ID: <e147f162-a52f-461e-9c70-4947019ca4ab@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:15:51 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] remoteproc: qcom: pas: Don't fail attach if the
 remote has crashed
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261015013827.716465-1-shengchao.guo@oss.qualcomm.com>
 <20261015013827.716465-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015013827.716465-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0a7dc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FBzCk_X8rep-KjbTXLsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MCBTYWx0ZWRfX38L3VDXQzWxI
 9oU3wiwny8zqK37nSshT5hFCYWgcVzlTe5uvVA4povBMSyzdN0WeB2/ualkxcJlCgHK0c5qrYib
 MyPnjiY8SAUZAX173H5aZXn1CzVBgQYi+bTpbxtArhRuvZAyKpGwWntpVoBRp8RtMIJsLgItMMk
 PCyQv7+KgrW91oX1sZliAcnLzxnVFLvPRBdZjl9h4Zqd7T3wRVNh0p15OR6PdiEsuXZBM6bmdrg
 fH/8kuWm+iMwzKh7oWCfZ7XNS7m5BdpY6z6qRiAXIngrNX3WJ9U5G29NrQikH6ZuITnC20HCLcr
 ohrGz57ia0Xiw2XT72QI7vtU+tMKi2/7f5nMI76hWlsmD5dx3zo4lD39nBZeqdSBY5es66XweVP
 YVQn/WbPv9uSSHlc/TM0uqGk+9OBNZdSYNm0xj5/qEIflZi6PAyZYUvOCv5cSLKp31Qa+6k/lcf
 axd/F8NbNOOY+gbMnyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MCBTYWx0ZWRfXwSiRsu5Nsmw7
 k/x+3A5HHMcO/ox+7If4cvfXQsMBZKa9h4EsA0NcTxNUVpSiTG+91bal35D69L6sNYZQfVmVMyg
 al1K6oDG1yHYEa26BRhxkoJJ6RiJstU=
X-Proofpoint-GUID: oFgRqMaPYwv-4J_mO7sD7_qLf8SFPgfm
X-Proofpoint-ORIG-GUID: oFgRqMaPYwv-4J_mO7sD7_qLf8SFPgfm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150040

On 10/15/26 3:38 AM, Shawn Guo wrote:
> When qcom_pas_attach() finds the fatal SMP2P bit already set, it reports
> a crash and then fails the attach. The core unwinds the attach while the
> crash work is queued: rproc_boot() drops the power refcount back to 0,
> and __rproc_attach()/rproc_attach() unprepare the subdevices, clean up
> the resource table and disable the IOMMU. Once rproc_boot() releases
> rproc->lock, the crash handler finds the rproc still RPROC_DETACHED,
> marks it RPROC_CRASHED and runs rproc_boot_recovery() on top of that
> torn-down state:

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
