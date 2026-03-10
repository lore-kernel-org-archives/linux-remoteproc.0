Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942BA2E65D
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101144; cv=none; b=TPPiQ5wZ/LyaZo2FgUtPMgtYJIgK6zLJZOO6Nk25gDj1MpMK8hXeK4CV2XhZw1yRv/kfqIvAwZhGR+RJj6HWCeQatgi3jS5pSHBFtSK/ls8nc3FVzuu6P83HMj5XuAAuVKIUDetooXwcZOz5nhg3TTjcjdFcpBX+d55rW4rbSaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101144; c=relaxed/simple;
	bh=T0/65QF3MBJJQP31ZApZm/ZsPyO0vYsXp8Y6HM9btnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhjfDyEBZtEZGea+SHBek77WMOYCHw9Ixq7K9l5AD0UKos7qGih+wugca8QTBr5YBRhhQSdm/fDXlwyCrxkXw107E0InoYj9B8dvzdF7zQbbUo68WW0AKfga6HvV8cE3OD9ZbRUOEde+UD/mQD+Ms0HsNf3e1gxYG8H4/RXo8bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAld0740; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZ3TesTR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAld0740";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZ3TesTR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCF6v1212212
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J5CmMvftPQdRpm7qJMkIbf75
	0JXDyx3tsLWdLk1U9gU=; b=aAld0740yTZ9VG9QfBPf2t95d9Rq13GKogiQTT9O
	YVNYct5kxhrYkFEjXZYiFCXdTWtOqdWX1fz7RdBAaZpaRKHCl6JBvyjwJDw0MExq
	MPLnp0N/nfdlQ7ofieRWP8DLgYGP2IMwPo+ClCXdFtKejxMmF2wPfi/eF8L2ZXc2
	qoMiU/Z28kEbDdzdvme029wGhnBwWs2kX4Bg0SRNeXuQsaHYpoqZwqzIgFowJJdZ
	tVDW/ZSRUhTYKr6CE8vuazziYX9UBcvpmd4i2BwtT9oluohV+EJFOGZXe5yRmbmC
	RF0A28dCIGQZsp3CpyRpHss8KBB6rrl42C6MgloXox7vzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkj4rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:05:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7c4ab845so978733685a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 17:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101142; x=1773705942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5CmMvftPQdRpm7qJMkIbf750JXDyx3tsLWdLk1U9gU=;
        b=BZ3TesTRoSwYwlNTy3PQYXDgaqwYFryhYolXmEb8MGn6kFstA4er48Mf7xvo/kHopa
         bMLpDQKe+41lXFiBwGPCT0Cq1jQiEgdhk320TVlAN+JEFTqw3nuMDpgP4bdr1CVLpyyG
         ZFIdTrP1fm6yKi+EIa6BZ/PJT8PiD2Lqi5RZAUJOZs9iRQuxqMCRZdav32yjY7Kj9uJJ
         ZJfDGljm3WiYofaZ3cQA2CZZA925CrCzmhWIREM1nLiL70UcVJvC/DO5QOqWjHHTAJE8
         FVmiOWf6oKnTmzYleLRgpYX6G2CLwBtPU2J4C906sBxQL7b99SXe4/yg/2IwroCsOduD
         84dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101142; x=1773705942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5CmMvftPQdRpm7qJMkIbf750JXDyx3tsLWdLk1U9gU=;
        b=DWmVuP2GmsZyKroFD2kg6PzyUpoEs3GmBpVeueYfaAVvF4DQLnRCXbWis+o9zfp7Gu
         209aVVruYfE1L5AgRtyayku1e9bLxwrwmPdRAJGmiYHfjZ3KC35Y235mt5Aqyy34JFxD
         OrgNb3RK92ufALyJ48Za+C+BIvIZja62JjwpSa1sqTh1DhPFvuZppv00TYk+kWqQFxFB
         RhnrhsVGl5neW1Uz5dbqx2c3IM5FaJoVbX8MYymmOqdWCfphzFTLtH/jB/NR4dS5Q0Xb
         dbWU8wy5fnrwcrA5h8+LwpaWnlmyvSxfZGpZsZGSvj66lMl/yGrTeiuybx15Iinmndgu
         TwIw==
X-Forwarded-Encrypted: i=1; AJvYcCUks/SMPRJauTnrHnrQxzcXYJZ84Db710BzY7vIk+IOhbOjDYlPFMWvzDMp8F5rS7WBDQ6+0SMiS21TlJ+bvFYr@vger.kernel.org
X-Gm-Message-State: AOJu0YweZE9L7dCy2wQpx6SQEusyYvnmtCQ2/IgtUhuoVe5PmqM3uYd+
	txAyZ+Nm6806QG2n5IWZzk1dIJEfcYEh/UHxDgLqDX9aoaML891uLyeF/N9DgE5O5ckfEs8it9c
	k/n+dvzSBa2/DeX/I05zTz3f9VnbNsilyVlxe39x5uF+XfeyfvuK9JRwQ8MB/pOpXsYrha1t6
X-Gm-Gg: ATEYQzyGc7ASJQVRbf6JE9egGQniM9xC+UrVsgBahTyPTM+3Pw3K26ks2DfPKd41da3
	guHhchc4hRbFGNldCOvdeaVAcZIwynChjYowdF/iw/pBXcOnlcK22ml+vuJQNj4lGyaY3hU1OBf
	+nbZrJl4M236dMlom4Gg6Sb5/thsGU637BZNXNpsrGi3qmr1mOtHoHAneT4mfYp2XAb5GIqdnJn
	l6G5ZPwBP/R1QbXvofXLzx2H5bfCIU68GH7dxUD0QY0nB0wILD81wMgL7SwkDt7Wy8OaatPkf3p
	ymbVNJmamFkqPqChfZCMhjGYgPqWSgYnZGjCBZtWelvYuII9E5e2JWoEVtpKZ2jJQavn3RJYB0o
	kDhoZyyz1zjIBlaNqQi5ta9PQmEzMG2hwQ4vPk6zZoRIeoe9d56vlK+1kKCsL1XSZ/MgtTBt1oE
	ONGx1afviUIukipLiEPTfJ53nq8POdQQ2f3vI=
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491284085a.78.1773101141871;
        Mon, 09 Mar 2026 17:05:41 -0700 (PDT)
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491280685a.78.1773101141400;
        Mon, 09 Mar 2026 17:05:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e051sm2527439e87.57.2026.03.09.17.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:05:40 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:05:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 4/8] remoteproc: qcom: Use the unified QMI service ID
 instead of defining it locally
Message-ID: <uc3jucz5fafdy3d5d4vtykozt5kqfyeax55nb4yjj36vnyxdtw@uwabt65hakpo>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69af6056 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=4Fe6SZaiIdGEmwW3mTUA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: YfcojP8NO_EyK2CZWaoTdUQVs3RA9UMO
X-Proofpoint-GUID: YfcojP8NO_EyK2CZWaoTdUQVs3RA9UMO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX4LT3vKvH5Xt1
 mUSP9cpc0J4GWgLjnS4XUwy+9kg76yrGMFdh9p1xehiTsE0thcpM3AvBQ0GYLjVmICZqIfZ8PL9
 7O6drSvpNIPDJxcDW8R8V0jEkK6hxKnmKPi/IxdwnNq1dt0Ijp8iARu/uO7ry4p4EO1vaC/qv6L
 G6+KGJdM1WUChOzdWO+jYJHa3FEGCEZ047RuRgkE+j1dgXlhkvK44uZV6w6gf81UmIvBU8dAR81
 gWyEKDHkjw3dnVhfjYaxChquz6Q/mqmEldXY/ZzFkyt7C6TzcRR5Q4qsSMct8DNbgyNXLODdqiQ
 63KRbbdu7fpqD2FKcQyyAtvCGNU9Jry+LeW4eEy/jvwB6Hklcs+tO1yAGIDPsUbkSaFM9xS9M/3
 Gu7dE4wTzFvz7zkB/nN546B01vKtx3k6sJWAtE3kQplPcqn8ijvAHwtYG0k9FZ/hFxDsb3BQ18c
 vRuhn1vNhRmutQZAjEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211

On Tue, Mar 10, 2026 at 12:03:33AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_sysmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
