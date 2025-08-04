Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1F025F78F
	for <linux-remoteproc@vger.kernel.org>; Mon,  4 Aug 2025 13:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754313266; cv=none; b=Nq+EVG0tpZwJrimGNWwX8VJwu4dyp2Mp0sWEKs+ImNLsFJPMPzTPo9lUDIwi00c6NNZMfR/DL+k6feYH6sua7Q9Rmg++1n1ALwrSHvlfBOuv70x60TSn14zSD7qU9YPF27VjPvZM71+iH+vISVmDzyOBdrB8SmlJ8qtumdeCu1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754313266; c=relaxed/simple;
	bh=nitCmAavgS3eup+SMOcSyyiqncdlMa5i+nammlA7TIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KyYYRu3fyUQq/XRoKDLTXilBzx56d9LIoIE8M6yei3/dH5dmXdhii5UbWGHVk/l8ltN2bu3GaApNUDf59qic9gC/muI88m3YS8guLbh42tvSDOxL0/SwL5oXO70uFLQ9F2uajoCD1jliOmGaNp8STskwck+9FpL9V3pIhrZGbFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dSBcPGe3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSBcPGe3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748m6UE003942
	for <linux-remoteproc@vger.kernel.org>; Mon, 4 Aug 2025 13:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iuqkYJEHU46HSu5bF/1m8NgiJsyaKNVDD5t0GtyZPKU=; b=dSBcPGe34hwe5cmj
	mNB3LlId72lzaYJtZSgzsodfASxhHgARWwRu90eZ1psCB2Cxis7dqc4ti5c19Bwh
	fS5Ol7nj6L/cPPs+hAdS0M3wuTukXxrxLvwdKWUhaKLuSfgzj/9XQ0ZXkaQ7CE+y
	TxJAZGADC6zvrzGWl+9zyEvsArtjZgCVl9c1z7tUMCfR/KC4VbZaNny4SVONspCj
	GO3WIoaOu0tLyRvMmtdxBoK0Fl1HxZkP8D7KTxc3htCsBBT2kevwoVjKQswWu9pO
	2Xjn7p/TxO3v+qi6ZnXmUO8ed/yL0nckSKO0rKjMumMPR60y7lltL86OcGSro+2d
	1BbibA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48a2ke369e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 04 Aug 2025 13:14:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e48325048aso90788685a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Aug 2025 06:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754313262; x=1754918062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iuqkYJEHU46HSu5bF/1m8NgiJsyaKNVDD5t0GtyZPKU=;
        b=YmQ6Zbmtz+pT2KbclvCyyasYMTZfGoyYuZswRcKFNp7uyRsXXMQIWuMS+QJ0u+HGn9
         hiz8S36IXaH9IyeoYUbc6rOnLDzw5lRQO9C/ZrLAgO+arMNqRgtZqZYkDWhLUxTGhq1Q
         MRMkJPX47pgHYOvr1/l44+fPqmAtLEZ9A0zpLeN8BG2o0ShYt+nCxUKbK76Wqm2gD8xY
         ivN7eGooubTwctsGUM55Kw2QzkG2JgLc078ebjYp7HfgZYoQi1mboRbCXhc11vtwGCY2
         LjuixjDsbL4w8Fz1HvIUSnIQiyA8xAEVCd4g/NzPOKQc3Haz/XTQ4w6qRJuUKnQNxazz
         oNwA==
X-Forwarded-Encrypted: i=1; AJvYcCX96goCRMu12/n2jYwq78qusaDUznL6Os5g9MhtYRWMC+6FF/fuiL7dLkdgF8+O5/hoXuVWx8KkEV+zpCoDteWm@vger.kernel.org
X-Gm-Message-State: AOJu0YwPEDpapOieWnqrYKDzP7OtksbGyLAG7dWFJSkJxOVcBgi2x57U
	dEDCB7gquUfnKzuGYwu5h5Sr6I5z/epf9ORqS2k1vNYf2PpJnE5UjSrksmAez6SAjOU7Bi2vzwc
	/YPlJKwGLF1y+BXL9eoIr2Mjeo9VxvsVO53KfSxuRxyznSWLZ5BEwOnySy1EZa+fLpRlJ3imL
X-Gm-Gg: ASbGncv3GJdlf1xBP97BbLMmKKUuN3YZWLOpjNxG1qZB8/kuB4bGyuFVyp4HYr/2Jsc
	cuI8ZMiyBuJl+271sfuAikzp3C65At4+JnjJar4pxh/byjo+Eyz9Efp09fBAzvEDdGyPAM36Ace
	zbC1LXyfRduCc3jGCo6zOAmR4YNXWprdIoff00LPlhmbaXoPNikDMRiyta9iqXCSjDmC0WJ4tDY
	HTX5PXmrCU7YZ9qxxvx6NCAW9IHRyCvwUrQBhv1QHlF1jePSZfVL8/I5wmjFTVwg6Y4GM3/Wu2Q
	8SWfbRCMU53iawK0xd/FidJTMS3eF00AJBMIHJxJbkOt9UAUvp2l8h4LgXRTiNWT55zNd+XQ36Y
	aYpSZbY8glLdY4JzTEA==
X-Received: by 2002:a05:620a:40c6:b0:7e8:5bb:b393 with SMTP id af79cd13be357-7e805bbb656mr127003785a.4.1754313261967;
        Mon, 04 Aug 2025 06:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQKfXoAA4iQAVx7vrakGz5rhAfhLmMpyLiivrawj8ql8YqoebUHyRY/Z++bxkV80jn4cAicg==
X-Received: by 2002:a05:620a:40c6:b0:7e8:5bb:b393 with SMTP id af79cd13be357-7e805bbb656mr127000885a.4.1754313261562;
        Mon, 04 Aug 2025 06:14:21 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8feaf2fsm6810919a12.38.2025.08.04.06.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 06:14:21 -0700 (PDT)
Message-ID: <dd278225-6680-4dc2-a0d4-e110fb2cfc20@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 15:14:18 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc: qcom: mdt_loader: Remove unused parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-1-5e74629a2241@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250804-mdtloader-changes-v1-1-5e74629a2241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qm1sqbH8g-sDyt8AZl_wUyExG0Ioc26f
X-Authority-Analysis: v=2.4 cv=TMNFS0la c=1 sm=1 tr=0 ts=6890b22f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=wXYMRSRB5Pq2Cuyld4wA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA3MyBTYWx0ZWRfX+Wo3dbhi1sMX
 Jv1tKa3B9rKwRHB5Tuk3UGDM/ogr+608y2wYESi+TgkRiGsQIkTffDrFUzBA4vbn6W3WbMAM4cR
 Vwn4ms6KLx+YTu6zxLyoso43jqoPc31IfvJr1Bt4+NwU8ADnDb7u2hpUH/bC+XfsRHok2mwHOA9
 y0njSYyRXNSgqwkfRDnw7LSOC8/fMsEcmYGHmlYGrW99ISyqrig0qRWIuK1fTdi+GsfbKvEXv9c
 +I0C9MkvT3CMKfE8DV+bIl67o7upR1ztO1rius0ovGUUhFWR1b0JeEDTX1h+WrvTEIQXgBwbXjJ
 jn0Qc/rnMKSxaDS5kSHy2zyW/dMNtUT+UyLmXuc0aTwAu9IpKFD3yLOP6hQwNoA7HlcqEKnsXiI
 DlMHgDVKaldNRAdTxCdauAVL350y8LSH5f8/40V0/8MeDCfCD+ldsKvz1uEt+MSgqbQuOxf2
X-Proofpoint-GUID: qm1sqbH8g-sDyt8AZl_wUyExG0Ioc26f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=960 bulkscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040073

On 8/4/25 2:41 PM, Mukesh Ojha wrote:
> commit f4e526ff7e38e ("soc: qcom: mdt_loader: Extract PAS
>  operations") move pas specific code from __qcom_mdt_load()
> to a separate function qcom_mdt_pas_init() after which the
> pas_init variable became unused in __qcom_mdt_load().
> 
> Remove pas_init argument from __qcom_mdt_load().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
