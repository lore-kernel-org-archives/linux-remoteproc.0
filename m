Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6473F6614
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785499149; cv=none; b=oaUU1C+a3QOjyQr6SBCeAyx3DOlC6xCPRqoVOluWH8ScZYi5aTGPTxBhbcDLDLoDck5QCEc9nHCf9WZKC/UyTq5vd3tVsTCL0yHTdVMRIb50vVBaDe6wmaKWerZRAVzjAigNx7RrxSYJDhqadBc8TwaQ/HQC7ZLXfvOHQIaYA4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785499149; c=relaxed/simple;
	bh=GELpTNNQJlbU2tl+wAZ0cQdnJgR+XPFVoYc2iOtYqcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DETreXS731McxpootEpgf4saCA06lg344kGwelN89ccHVfynpt6FxazmCbzFMA5Vxb5jgPVdrY37M1kMRLQzMsMjSJkTuahXlLs0MQefSOFHRiQYcTS6KY25P5Phzbavs1foTVo0AHhvJrB+sGFrJvB6sqybIrRcO8ymouhoLL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gawz+7qI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KqmDNup3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gawz+7qI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KqmDNup3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBawSk4079713
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 11:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0deU4TNX6fHxv9J0oFHoUXvgfYFVyrZJE+0KzVtFN4=; b=Gawz+7qItjp6JBG4
	wSZFtXV1r/8lDCem7/WneX55pR5DsP5IgR2DBJcb8TDx5PDGjU625+zPx6tKUInV
	bR72gzJbsg8LvXnGgUVwnTQBvA/usttj6SK3vC0RA2+UtSjwIQPiPgvX6h6CY/UH
	t8ScB06S8QsC+IKuD5CCTRPTt4ySIE4GXRGunyqpMK4ZlMcht+Txh72m0kMkDzMQ
	lXmlwk9gQGyNavFuxOIQH89B3h7AILhdJDwNSkx1g4Q/7doHozLD1/04c6ZdAFCJ
	3Kd804ctHFVuqUgMASBgyRYYGcCIw1xmTv/+y8hoEsmB2Sde+uhOt96fl2VBuwmm
	xiow5Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru0582m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 11:59:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0f0a0760so17988051cf.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785499145; x=1786103945; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M0deU4TNX6fHxv9J0oFHoUXvgfYFVyrZJE+0KzVtFN4=;
        b=KqmDNup3IOlZq+NKpDSTR6kQRcHHpVyMqsKlrROjRvbzUo4hFXiOkpYlwQ+MMgWP3n
         +LtwTo/ZlS9/4xmFwR93Pm6y1fxm+v9DWIECsXtcKvkgqYfYf/x+gFJ70DaJrX1xblEc
         P/GuD+bVbn+SoyASahi4xU5+HuTbnJ2hZrRexAhBWbsXLYW2A6f6YX8zX4f3lwPs6i8v
         zWHbCEqzfsQV81Id2+1urG1QpZVPp9I4L21t3vDvU62tsV2/OoJYT2YE9rWUAGhryrz2
         qqQ/L821w+mJZ1CWDGrrafgJHkZT6zsRWzLSK5Gq7lTcrDKqVyVZBru9TJM8UROiEOiH
         L8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785499145; x=1786103945;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M0deU4TNX6fHxv9J0oFHoUXvgfYFVyrZJE+0KzVtFN4=;
        b=ZeegnwsSsURcWoanRmjitVP7s99t8z0uipiplIVF2rtnPJ+74NJ4HQ7bJxrM76BdB/
         CpoTDhQUKdE6/FR84JNvt//HvS1AnXCg7x2F+7uJP6u1TvYUZMFyRq1vuiSBssLeQQs4
         YB4g591BtdH/Y8RFIpaQl1yeNy9y6hGEWLRlMPTmNxCJ6r3evEd2ztajQGbgzxDLSSvm
         CU43Fy4nLjkIzMiRnqQjDmLwWwomUg1DhE6oAFhJKfmcClQEIPniJzV3AYRf7CXZOzSj
         3ujgYrhItGTMHZaWF6zxiS1YxLxXC6oBJgyWcSBasNikwbuFl0FLq3Co/iZ1kX1GUUtW
         ohsg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6wer09lwZ0QJLRMqojnI/C5T8GFWJ97ZLHnIpYDVxMi4p0JLr1out+yzO8kQplRqm5Re3o2pVwTg+9eIRyIns@vger.kernel.org
X-Gm-Message-State: AOJu0YwjrTjA3+6DwT8yJTuOhtTXbxSuODPpThlB9PjTGM4byvyralYX
	yFpOcydtxGc2PJJh8wSl5KqQX2BgZFqvLndvR/12l0XYtDCX41uY9Ni5530bxfRCgIVjSqmudwo
	BVxEUm/rNUiKXfTMr5LKuXyE5Qbm2EJX/dkTxg1vvfuaNHE7azM3psB+M4tlPDoOxSqk7Ik/5
X-Gm-Gg: AR+sD11oGy7hCxtfe+TevyaiDLCb+3elf9qD6xJ7UtpvmFxFogngKaEHngUbj21Aj6N
	z3COSG+dBYkO82UU50GADxEVCP0uK4cDRY4D6/O0Bn0i0OWQOTN7wNURKT/pojeTeqEq2VHYX0x
	KElZeiNNK4A+WpOqDrJxRSV6LGwhh1Djc66VD8BYwIEc4yfyFXxvM7mpgDdEaBw89aIP0J6WmMR
	/3FIiZg1EILSvaxuSp/EtWBVckD4GockSYcf6LFOCzfwvKEKWYYtZob9CxPMXXOSuwLvGHuuP2W
	ZmqCsrPVVIfS8Fw9jRwMxxoR0cglhN1cV6uxuX3gL0bBfC8OliFifSn6oV39iVjZ3s2/5VeIVM2
	c7TUksZdtMG1RRQY=
X-Received: by 2002:a05:622a:5593:b0:517:5bc1:e1f0 with SMTP id d75a77b69052e-52b4aa0c880mr23329211cf.0.1785499144730;
        Fri, 31 Jul 2026 04:59:04 -0700 (PDT)
X-Received: by 2002:a05:622a:5593:b0:517:5bc1:e1f0 with SMTP id d75a77b69052e-52b4aa0c880mr23328911cf.0.1785499144278;
        Fri, 31 Jul 2026 04:59:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4068fb7sm4618924f8f.0.2026.07.31.04.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:59:03 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:59:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
Message-ID: <aljdjmmenszu2gtdeqy47sblo7cfz2hg2rxvaedie2s27e7gcv@jdzrzzdxrwbg>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
 <20260731-b4-qmi-tmd-v7-9-3befd44403d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731-b4-qmi-tmd-v7-9-3befd44403d5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MNVQXsZl c=1 sm=1 tr=0 ts=6a6c8e0a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfXxlG+DfR6UoZr
 7+sGOCqtV3/lRAYq0eZ3ln4wwP/FD8qDh04hNl/u4WV2LKjkyv39RKJ733SM5bcQBUUA8m/TNIj
 xTt8KoZD6PqVVAqNretLuIOSKCFymgo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfX23XeVNargOnC
 XnhP1uuHKwikz8Cju6+5K34IoesZhlX5HYD6b4lhAM9hylgrv5iSnymm4QkB8NUmS/2WKngchq/
 p4RxVw8TODZkihX6o4cDcvVV4fEfLx7BvCVJGXk0qllyj8e6WbfBbnA+KrsCntudJnC2ToqhEkE
 51Zh1iatwUduCOrXQORsqpXokt7EuFFiss55FjjjaTjvKcBmdV+5tVgBCQ7VSY1tIRXtpMEqx8f
 P13mPtBY+QHPwuhxj9PlFTcB4tYQWSJ+foqUaTE6KShlBPFwCxCYA+cWwKNZWz/Hfp4mDueG/Tf
 4yPTrgM5aioifweVV31yV3z11H9//tO3lKwTqiQITB+kTkld5HDYfWrQeoZJWNaSTQ/XW1jWSfO
 2Kh+j4HUkOxYJZd3GEKhFLPDXIVwHE1k4gFKpRGfOHo6CV1Q3/JhL66cF7Oo1MxfW3Mgla5ILGK
 hssxk+pqsyt2tBbN9Yw==
X-Proofpoint-GUID: VX1RgyOWjhnp07pc4bLmfah8zIlm0bsK
X-Proofpoint-ORIG-GUID: VX1RgyOWjhnp07pc4bLmfah8zIlm0bsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310091

On 26-07-31 16:03:49, Gaurav Kohli wrote:
> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> 
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in hamoa.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 95°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

With comments from Stephan addressed, patch looks good to me:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
