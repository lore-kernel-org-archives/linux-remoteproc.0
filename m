Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08CC4CCDC0
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 17:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790011018; cv=none; b=AsHB2p/Faj38Xo25Zxv9aA6LEvxSAA3WFd08wAppC5UA5XvFqmGQqlaYFYgMGeV3WjQ6zJO+Y4ZmGl4WdsMvVYIom/CVUSEi+pzYlXCy5zVOcs5jziBLUDq9XVuTqkOO9AM/6uVMjPtChtheqdhaVzBaS5xMBPHEeU63VO564h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790011018; c=relaxed/simple;
	bh=cl9t1QQ0KFnx39LYctZdasI1zjthTbRNk5P/Du+zM+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7VCDCg3hMMtVKDdPmbdMaT4A0A+/xdS5q+W0C68HwTyboQ5cbTePy/x2T5NIrfylVO7VCZ9/SJkdKOIurTSAXB4VRIPs/0wNU9mrlMMa0vmZS5zwfM9JWl/hqcsYaFvTcaR7bxCU/qYla4iZTdgssfXT6O7qOduNNlxp3yvLjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjRVyoky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1c1nLPa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjRVyoky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1c1nLPa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAb7Z2012798
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 17:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cl9t1QQ0KFn
	x39LYctZdasI1zjthTbRNk5P/Du+zM+g=; b=jjRVyokypvhg6PgFh4WpSIk260f
	+i5YTRfWywudi9WQZ3m2FXuTyC1UI/zbDsmE2b9tGjpMd5vYrBzNALquiNHVqmJh
	wAn0gcEQr9TzJbOjRi/ayrqNI4WGg6P+3gDNa5C2+EWu/sTYa9MSNOo9/oek+Q13
	XTb2X63h9HmYFjoU2WK7pH1bD9JAEipPiSpnrAwfEXShj9mCq8WWxZUgrsAN567C
	GK/cSlC2c4FebSlTMJwc+7YKepvevqORsiK+e91NbzbTwvkQp24jYwFWWceB49Tj
	r2ncO+NBXnpnJswgOqnhPinvC2tyWD7m1yjQQ2zs8W8V7MJQ8tY/aFooiuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d2eck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 17:16:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b6416441eso5362350a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 10:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790011015; x=1790615815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cl9t1QQ0KFnx39LYctZdasI1zjthTbRNk5P/Du+zM+g=;
        b=B1c1nLPa0/x/wnNcViq3wumxCefKBJGlI6B2fbLgSRI+ywHDRXW5bDroLWpMdeVb7L
         0o7+dK9i/082k2roPqcvol/YQ3IZ2rk0cH+wCNLy0SUS3lWYlCklBrKuHqg9CWediSHV
         L1pXwjUyG+LvA54rCYdyB+FfJibcuIuRkpX2JkF6IfG5SO64M+cQMYpCnoA/DLSVq7Xa
         wot8ADqvokCkDq/nGkLhNPJuKJvfBeDXdT+TUA4HkGRbmJidG6siMvu6WlnWAt4G8GcP
         9WV0Ya1/KrtavGta3XXMxqr5OBALBy0oZZTip9fE7yrBoLE+xl0qjNKGKseL17J+C0i/
         0MLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790011015; x=1790615815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cl9t1QQ0KFnx39LYctZdasI1zjthTbRNk5P/Du+zM+g=;
        b=yNGfMPg6jlpGXayY8gK0g13ghNJWAbQX2KEMii29Cc97sYG2fmKgzIUV2ml1hVD7iD
         6UxAMwejHxO7U1Bn+lWmzB4rjIETLPm7npJErSkuVuBOrvrVLbUXsPk0KfDoCNwIzKxG
         D0TcN6PolUL14S9MyLBw1VD7/m1440SvYSHulECJWo8sfuLPtggb14Di63FZjI9fivSA
         DhP+Vu95QPfba5oSqUqI8XqJlSrSOsUuYX22BYabehE115Fb12ePKEvpw3Hi2jDh2jX6
         2k7UPfNLfNmjjPRBLgIzFXvACty5MFVs8EhehNP3dRqrK3JvFMac0bZirCXRjQgAOLs3
         LV8Q==
X-Forwarded-Encrypted: i=1; AKwUvBz5pCfOBU7CIyq580pyDl5/GtrHl0C9Tf3K45RchKInmXh2bmQlBBfSMqLs14Q3zqkpx3M3WbROs/60tIShycpa@vger.kernel.org
X-Gm-Message-State: AFuF++kwJWvuVjm4Cbq0qUcdBg5D9m7vfuQk/XZY/0PuXW4AxOGcDtXy
	PbpIxyOyVRKzL2G4iSoOTWUWbIEvBkQ8qCscPXycF8FpLcs+TafMtAFdao0XrvJRWkUqU5ax8M/
	TwQaQpCLa19atfg0LuDBMVxYhUEF9vWzYF8FZXrZWulBeyaH3JMlZwrJlJKdVUx14yh726ec0
X-Gm-Gg: AYBFou2c1FP37QC69UFdvhVv1gvyh1QYYinZHHg1Sm19LYb6ZIcRbY3ruqA4bzBVhdf
	6ePz+2I8ZiCzeAk55SVIlrKOzlitngieMrs+QAP0lsu9EPKvNhpMry9npTgoOv5wYeUhiNv1eCc
	bEXV8HV89VzDP2uYa/NuQq4a9D1ijs4VqxJhJHJjm++MYRj56vJUhINOJ/lEb4MY2khOvBWUdtq
	I6OY1vA6A9By/azjX/wf44m8S4xLLvwPI/E1XAyV4Ah3fH+HyvOm96rPd1aW2238zRHUyH1Q3gn
	Jr96CuwfcEq2/atKrlY2wH9qaD+rIqRs/ycRqgWXrDKyivZtDv2qMW+cZW4RdZBr8jefbYPdDZP
	QUU9YMtJeENnEQ2gb8PCWonolEBn2V9SplDFm
X-Received: by 2002:a17:90b:5588:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-39e54cbb4a5mr18389422a91.1.1790011014779;
        Mon, 21 Sep 2026 10:16:54 -0700 (PDT)
X-Received: by 2002:a17:90b:5588:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-39e54cbb4a5mr18389397a91.1.1790011014351;
        Mon, 21 Sep 2026 10:16:54 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55895112sm7979798a91.3.2026.09.21.10.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 10:16:54 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org
Cc: saileshnandanavanam@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix off-by-one error in regulator error cleanup
Date: Mon, 21 Sep 2026 22:46:49 +0530
Message-ID: <20260921171649.3668492-1-anup.vishwakarma@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAF+TLO0+snqqrrU_h-psciUmX3e4447opf9o0vEhuT8CTrDn9A@mail.gmail.com>
References: <CAF+TLO0+snqqrrU_h-psciUmX3e4447opf9o0vEhuT8CTrDn9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bYmYmq-71A3XYdHCu4cb-biwTQYsBai9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI1MiBTYWx0ZWRfX9g3btrGA9vVt
 gBTluelpJpLD34bfVNoRnqz4Sp8W1FCbLeGAJjaN4WnteD+wqY7d4QyaiNUpYrJQZXOq4f8N8ga
 D0pVAkRDtOfjdr+SN2q1YG/aGDBdpEg=
X-Proofpoint-GUID: bYmYmq-71A3XYdHCu4cb-biwTQYsBai9
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab16687 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=F0ZBgddFi5Bsh_et688A:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI1MiBTYWx0ZWRfX+Jg7NweZlohe
 NsSFe3IiMMicYxIxZ3xtfj0mRaGVqmriblo/AIbw/0UP6Qbbcasi8kUw14JXZSDyfrxdVF1GIgn
 dtHQv54DwGBHlOFef7M7TW4vkwU/W2zqCh4jV5sSZsjFm7WrhfNMg6YcZDWtIENMh0Z7zAFQcoJ
 TZSqanR60zAkU8chdAv6o6TRqxAlV23NYHiqkfCiat8ovr4z+SQdijLK5zC1bCUuRSm0hW9Uw+U
 Fi3PhdGD/o+t5DnH4/sIrBb7/RDrS+r2Qy0edB6kvdXDbcyu+r+/40L02jxWym6Kyskik4vU/UQ
 pgdGn0SX//Yx8JsGzOl5d63x3Gj9o1BwnPkS8AnbUIHsRod8lvzkp34pNP0pM2cXL1jFKbWtOEy
 ZAMrBnQT39jcvcBzBiora/q0ENmStO/HlTnuWLuVRLY7DLs22ITlq9EVVzPqdVtJZuLYn6nRCmV
 E78/4uH8IZWgYQF/6SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210252

Hi Sailesh, Bjorn, Mathieu,

Thanks for the ping, Sailesh. I was not aware of your earlier patch
when I submitted mine. Please take Sailesh's patch - it was posted
first and has more reviews.

Regards,
Anup Vishwakarma
