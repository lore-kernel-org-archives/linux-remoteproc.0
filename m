Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB74374172
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 14:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930416; cv=none; b=Mql2sdX/XquGSDPUvuhJXkTkZGXOouAhwRPzuzIDPbcKIA8ga7iNbWMzyG7MuvPzIyItpUyoN4HIpfewvIo9QvL0wfZpqLC84i8++hmWNJ+HBoN6zEdNsEgyep4Lbp/xkovW1y4QmFfXEIpuEywzGkJFPjLQf9Cu1VcNzTeSLso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930416; c=relaxed/simple;
	bh=gv/hMc9jdlSB/rscIFbQEP/TqOb9j2QNFxeTSfCKR1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+22q6TCR1uQvtQHu6P9weX6fKB37o9q0KkRNQgJHyz7i6ZvngqeXVp69Kdc/DXFetifq0ge2RtdLBZbt1Yob9QswPsfjCkoEkBAU2FXTzVm587qzt0N0UPTlmYp/3+CjOoyjM6yWd/U/AolRJ4iEu+aSTtGUDRMcKuJPGxTAPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QarXSthN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQY1xAGI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QarXSthN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQY1xAGI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74AHa1027821
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 14:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=; b=QarXSthNOTFkFQkO
	al/Azz2zcOzljz5BjrIOubnbmfGGbJxmmQ6cd3iZzccgYCrqJkS037p8ei3Yw2FW
	fMzY7wYL+M5x2a7CvA7ibvc7ftLepU8jZ7dSDLW/7wr4j35FiC+FuakovAkA5bEm
	oGhBZx90FsY6NawlnD2SuBkSEDvQ96PcWAnwDx73MXSASpvIq5ZWduCJ2vU8umlO
	caIcH0KHhMuAYkUt63XzSI7fCMxfvrzce+sUtWLDPgdWVXG6MaJGGEkZZ+JBYqeT
	9j36iOmD17f1976Lp7w4hBhFRavlaBWubY2hiT8tzn47U08eYCOK0hBVP60sOrdU
	sPGUNw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032kmgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 14:26:52 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-67bbb4e5f24so8343449eaf.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 07:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773930411; x=1774535211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=;
        b=GQY1xAGIZYBfMZ8HFqzjBWfRHLQbkLwgn6iJZtpnYTi2+wZvOUzUcGPPiCqlB3/dxf
         U/O/+h/PrHD9s8GAz38hwaetwHdBLy/f2bbHPGcjkgqyNUxz2BN6N1vGWT6sxq0uvpUT
         JYYhtiqnPk8Hgaaow8VEz4c4FvzW99+QFqWrBVEXmsorZ+NBy72CSu5p2kvJVBB4ayy9
         z2+sMrXs+Q/KqSskYyS7xUvK+7UpLdTilzFXEsmeF9wCFTKWls6/eye8yvaVppjsyUGD
         0zEvycxEe3bB8xdHyVM1LJPR/homONc/F4QHunP5SFmufkLRbrzD3xaf5ug/2F/GwAav
         zf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930411; x=1774535211;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=;
        b=hYI7Wx7K7vKpG3zOlCHK8iZm4lzqdVukpTFRDFZFWvX9C2LrdNyTnfEQ0QKhHgpYd4
         Eip1uapUvErAF+RPlPt7jYa2HVEDDw1nOVQt35HXJWh4n+H3tj31asfFD2IJiVmNq8N+
         s/VZh/eyA0yFoCUyuCRoSElmJj7dnsEaWSD6mAmIIidjLHfYbSmuPFhOS4CoEKmCr0gc
         tREDM6Vyz0F2PLjg4pq2VPfNMmUYGoWh8X7/pH/qAN0bvEhf/x31FXr+/fKQ0kKeJF55
         L7+pUo6o2vuX6myFCLIilj+M4bw3J54VI7/7J3awNVK8reROqf3VJr3pWEzVbf+k7hRL
         N7Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWoK5uwe+DEeHJhxuqce9H7ILxz7rBF6eSsbBHJIeRLVnCq4LU6jfgsx9ujncIqo7aNYauRzDXf5gQxHTKx2wO0@vger.kernel.org
X-Gm-Message-State: AOJu0YwegeN6kSl0KYYH5Pyi9uhDyOkccY3/rvUxaAjfXDNeRsqKtQe0
	DGUeIOe2s90J80/ht7u5tjg30/T++XqFPk6873J/4sESC/YRKD13s7pBqayX3fzDmAXxfPV6vs0
	bDOiCUO5cuuETsCh2jB2pyirRqUVc5m3Ow9rzwWOn46bjQTFCBu6Wnx76f0xZBiqZGcdBmg8lK2
	xUzzhI
X-Gm-Gg: ATEYQzzosBwsE/0nMGoANYh5VaSP0XX1D487hrUws3pDo0qUm9ro+IWPVRsXRJrJrCp
	tcYIfH1pvm0NYt0XlF1JFEK3TJStM49hTmaVqUZivHD7I71ahwH3lFfE/hvj4D+Ah+sdMQ7trRV
	aNdhziGVoQcgjM+lcmywOQDm8LAPiImqDpSJCSJDA/Mlxc1RBJdD/PK6W07IpFDUMrP6G5O/wvO
	7+jYhEpoYmZF/3A/UEpOPXZYbSXuNjO8AmypQS5rw3CGBbtm6liwk9MpERmBcmO8/RkoDAnTM+L
	t0Or7dY6zcc5pLwKY64+plAOuS1zvKcq6L8ooa4JNcq5DNEIwax/xdZZwGONyjxqxQjQIfgceGH
	YUJ8cJKC6yrP8O6QnmLPgJf0wDy/prB83ZAPF1G2Jyeq5pNkFF4aU6Y2IoERvKDOGLAYfqlYx79
	UDydlK7Tspyhxw+w==
X-Received: by 2002:a05:6820:61f:b0:67c:1e60:3e90 with SMTP id 006d021491bc7-67c1e604939mr746062eaf.6.1773930411234;
        Thu, 19 Mar 2026 07:26:51 -0700 (PDT)
X-Received: by 2002:a05:6820:61f:b0:67c:1e60:3e90 with SMTP id 006d021491bc7-67c1e604939mr746016eaf.6.1773930410817;
        Thu, 19 Mar 2026 07:26:50 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41bd2d14b63sm5729630fac.16.2026.03.19.07.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:26:50 -0700 (PDT)
Message-ID: <51e28a7f-8362-4bf1-9b9a-9af9cda1d748@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:26:46 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath: Use the unified QMI service ID instead
 of defining it locally
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
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
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: udUpXMwyEnT31sd2ErSIe7Ghi3SeUACq
X-Proofpoint-GUID: udUpXMwyEnT31sd2ErSIe7Ghi3SeUACq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDExNCBTYWx0ZWRfXxt2Ml48MQf+O
 xZDaGpsPyounKy+MxRQL7v+y89peY3KyKyprJtWLqCOB10KkDGXCLwdSTkKZ105IH2eAMXbbPNh
 +5iI+Iem6STSMzI9WydDhzNVQeoK/R5L+kcO++/VMtCAblkC9awwXyRD1eNuT281DQjerbrvvRh
 B8MUuYp7zV5EIwnc8Nt720s10bP8DMCnRLuWBjIliFB/9WYEAkcA2z3z1ri3XPAdcnp9dZOzUnt
 40NphACdf5H1CuzY30r1Ek17BGcB4vDsopfvmwat8ZZFd60T2UJU+bVC3vH5ry6EnCO2Qe/Flmf
 Olb6H6Z1Y5MJUBecT4B4SfJ/S3GkFo2xc9i6TqPcIa/m5TUd22x7JN8RAKchH7axoqoIMJsNh/P
 I0auWptb+5OKRGovj/hvc1E9iPB2+9+iZ66DJNvxi4dnAbnHJnFAagoRpCM9Zfzz1a2OAq5xQAO
 Y9G0a03zoq2sYxnCMpA==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69bc07ac cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yAZrW0GqhKXZdV71gCQA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190114

On 3/16/2026 10:14 AM, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Bjorn,
Feel free to take this through your tree since I don't think it will conflict
with anything in mine and it will take time for the definition to propagate
back to my tree via the normal workflow (which I would prefer over merging the
immutable branch).

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


