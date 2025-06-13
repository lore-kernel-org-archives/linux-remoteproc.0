Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0E91A2389
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Jun 2025 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823776; cv=none; b=NlnBkqywFMuUeirl7a84f0YxvdVLZkbbw2v2EcB9L/SYTA5vYF8KF2bs4ESjIiyaRldCe4sj6wMBnsiCrjkCRHgTEp+muY5p1AQH1pte3cQAS56ux9k6Xj3JEUYVFaSl6w736BAivCs3WU2QAkp2xCHNb9yIatwW+CxaMBII5yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823776; c=relaxed/simple;
	bh=9ybk7RoIxVOTSKEF8RhhpxFfV6/NthPvrJR3mww0pOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgCABLSbxrNf2bzmXUw2lTdNbBo5nqcLZMDcYy70XteYs1JUUfTuDNZP1jTC2JcymfMXAY6XSqbe9HmWHczqZi18W6+xGTL2L3RKdO+rBc1sBvC/OGBu59Kvyg+q6CHVx5004f3jcb73P2lCJnN27l/2VSDLBdDgRiwsG0R+AYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phlfbA9i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phlfbA9i"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D0j1Al008328
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Jun 2025 14:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dBbKcLZy+Jxr/umSkxl0m8Tk
	8e+YIMdKicRZEcvJZzA=; b=phlfbA9iTDvq1WogUJYlWJS8EhtGPIDz2A6VewGW
	3Yq3W1pyrbl/1giXjxXG7Ovg7eSya2uVhq5cxbPlwugPyawQDkwhDKBr22IuENs6
	Z6iibqYWe1PPDgRfrafXyBQJUycsLZULTX434MtUAGY5nV2PqnVMW8gZyU1slf7B
	8JiiF07QDEgl5O4BNLEFVfAJXgTG4/orRouz3R/O/ZI9YsfvEApvXBNYKrnZdkUc
	9iRPZgl2rPOthRhVW0yxNQVp8gAlozhOkT3CT25y/Kr+uL3Rv+vPJ6plkFoQ1M5k
	DMWLSWrrqwSAAV+SOIaeoy4CpI6gvQ0PWXq65ZzEAJtrDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcuqkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Jun 2025 14:09:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097fd7b32so512930285a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Jun 2025 07:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823773; x=1750428573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBbKcLZy+Jxr/umSkxl0m8Tk8e+YIMdKicRZEcvJZzA=;
        b=w+R547Hxg6OQbPUj/7tDqtFS2cYJoeGOeM3buR8/Wu72ZN4jpEn+5yHLqyL4hgQMEP
         08+mgLx/em1qXX2UcT2/UVUeYyMGcb30a8hM5K8M868UNrl2uwyo5DOGWWBZ389fgAHg
         GFWuGcZSMd3h20veSe7qZu5RpVX3MUX6cUeb4HrsAZVPov1RlnAHeZFmZ7E0Y0dvfWwV
         fbFHxON7Vob5cHVmb15XVc5LW4ELP6jpGx6Z9l62+lHbdMPh4EfudtCvCZdGTYMdrCf5
         zlq0Grk3aTWTi7ZrRQKhBK7EpkarlDe+eGm03g2gWB4NboOCA2frIqLn4ADNsku+CzO2
         aYTw==
X-Forwarded-Encrypted: i=1; AJvYcCU/H2F7stsc+Znmr5f8C2Vae3VrHEZ91CQKTOrJ1L+y3HyW+3NA4xnr+Mcj4LTKGEi9EQJuHJ9NLnTpnlxpBZoA@vger.kernel.org
X-Gm-Message-State: AOJu0YyWNamGhbtlQ0HnF/aiS/L5ePlbKTNcHThYlaezMyETX+WhkmvX
	ZAd8UnbSL3c50dd57PW+70rRzONF69iQcvdKd2iLa56wkYwKAGvpNGecY3XB9TD6nTklzsrkTt3
	M3CEg7DWZcNKk6JeVtSp4m9rmE+3tLYy13k3kiUzgrnq+MIffFHc8gBwAszrds92VaQyJ2pDL
X-Gm-Gg: ASbGncuibs0nX5c8nAWiHupyFjFbullRmUre76zd55aB7MD8bc5Gn/y+oT6VHCMckWm
	MfMuTMAW5stXPAz4Rp62gC6cbPp/LBbLTxsxo53qjgK2bDr+zw8ygtWUfN4eXXgj29oM/Y8yrWR
	KMRs6UyynFGIgnPRLNUHgQ21zDOL3Vml1EmN08W7yB8pD/y5GyLjC7ZgTLfDawDTcKoGMvkoxGn
	JC4VVv5dy1ArFnZAkgSDqxx0OyM05ztkqELlKlrazG5SxI53Z7B6uyxk4+fVdSoApJ3Lp7yiRLD
	mT1nhKl3OeTY/fLV3YAenzA39/zI9QhVsrgwiIST4dPIVc5w5ucE9HaTdS1eD943y31GgRZJc3l
	fgtgIaYMSM/7m7zHrFTkrC9wl1m3FRj9e+0U=
X-Received: by 2002:a05:620a:2989:b0:7d3:9201:850c with SMTP id af79cd13be357-7d3bc3ace08mr455413985a.14.1749823772919;
        Fri, 13 Jun 2025 07:09:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl8SN7pbaLAjQfx5kpcmJcfOmKWAhZsdbfkETLGHu4trAzY1dXsnxEVeHBZOpN1dpoy0tfGQ==
X-Received: by 2002:a05:620a:2989:b0:7d3:9201:850c with SMTP id af79cd13be357-7d3bc3ace08mr455406685a.14.1749823772367;
        Fri, 13 Jun 2025 07:09:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac134f46sm459281e87.57.2025.06.13.07.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:09:31 -0700 (PDT)
Date: Fri, 13 Jun 2025 17:09:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sa8775p-pas: Correct
 the interrupt number
Message-ID: <bjys3ptti725husvinnny6k5qtblqpcnsnignt5t62psuhgkz4@rlabonf2wwe2>
References: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
 <20250612-correct_interrupt_for_remoteproc-v1-1-490ee6d92a1b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-correct_interrupt_for_remoteproc-v1-1-490ee6d92a1b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNCBTYWx0ZWRfX3N5Jzc/r/RyO
 OUnaJ/90myTMGBfM6aJaERKaYje+YUJ/FqL7HzdwS+e5BkiPMR3jc6uqNHIi/9G1oRhRlbmaUlw
 UaoAbogyfT20SgfuvSeLpg3ERY9H82/5uTyYaxNca3aEtM8U6ceSC352APWGE4L73uKGd+JYoBy
 EM9YxOjcT8I9fs3aCXbKb27wkdPflJVt8tCUfmSpO6kPdEyeiYfu2KWgFTBUGyt6T2LtjWOA2MK
 rWjB8NyG+SA2KJp8ij3tCwQhyEAcDD/QpAaj0ZR2EUzAQ281KAryoVaT/tUyaWML4mME1lOqD5H
 AO8+ftMBbkeUWrpUfFYqVjTQScyzSDSyZmkrgEq7ASoT1sWHNYlr6SeXOuSQjhgiK/tb9mhOhNc
 zavIMKdDObsXdkeJLLJehNbu2mtUQ1upj59oBQBIAC1+JxqJ0bzgGc0nZObayixZV0COq33b
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=684c311e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=zHrrO1oeWpa5Vr4l-gIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 8JZzaK4vavoj6EhWzeaQAjABsnzosYSR
X-Proofpoint-ORIG-GUID: 8JZzaK4vavoj6EhWzeaQAjABsnzosYSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=733
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130104

On Thu, Jun 12, 2025 at 10:39:32AM +0800, Lijuan Gao wrote:
> Correct the interrupt number of ready and handover in the DTS example.
> 
> Fixes: af5da7b0944c ("dt-bindings: remoteproc: qcom,sa8775p-pas: Document the SA8775p ADSP, CDSP and GPDSP")
> Signed-off-by: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
