Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDE32FC87B
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 09:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855025; cv=none; b=P1P4QrZygARUJVphVSKqKBri73OetwElvBomIEAfO3jK0lNQZJCpt1mH0vZuVaCyp+SuBMyKc3yXlmTegT7fElV7v2cfuzZPiWKBWTlkkKRBD2BlRm9LWUxxSEIsdMR0Q/OqcBzpBNDl6RKYVSfmj1RCQT963NuiFd+fJ5pXXGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855025; c=relaxed/simple;
	bh=DDOINDlN4zJfXeUV+i7J2/ny9DQpMWb+X2z1LIO2v0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJfuZjkQjAFe6+tXUiiiclRW4f8l9tHZIJlHPh9S09KiLzvbG/Wvj543zHrApqTC7H1GEiqGQNlvYjLIH0zk4No/pHWhmWqgOTXpPZ2ycxd3RwKG/wDXKiVp+0wRSNj1MqBQns2oLzFfbJtraL3LeWmQkHMJJZ6X9nIKTzMC490=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWVpWQk1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWVpWQk1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UwUB028334
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 09:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=apgzY6IIDslGxm2ZxHxgxxLn
	8qHnWA9Q7ouAHkWulDk=; b=PWVpWQk1s5S5VH+XVqgN6h5G1JwLdtQQbiOc7xJ+
	0avKZl8+BGCTG5VQkt+ZbnVhRAOZiNxwELWjL29adVz8OGkSCuSHBIkMRw8wQApy
	0eg0Rr2mA3MFwnDGdV/0on3OB6DgBwxkGBj7pRVprDS3N9GEvcnuDFpCxmYMztt7
	b8hbsSnIaivhLona9IzshfMvX4h11oLDijqNfiLDG/m2vPEGDLxgTtvQ/dqZ09z4
	W7L8GDZh0tsDNpQcc3i4ohWSq/4EdqArFvBi69DeK5WZWDwPF0+ez9SoHCFid/of
	F8yDHBND57vBPkqDmB6Vk9BFAT24AZn+D7inmHA4neCUMg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5298q0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 09:30:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e92b3dde9so1940959b3a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 02:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855022; x=1756459822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apgzY6IIDslGxm2ZxHxgxxLn8qHnWA9Q7ouAHkWulDk=;
        b=abeLuVmdymvYMefMscviCYI1XsYJ81FDl8KtpT2C3GGNXIl/P2n1j/czQHsdApStDB
         2nYy4U+dABqr8PnHND3wDao7EcaL+MkCVosCqxOL/P1Ty25jQff7mpha/Mq3HmmqqmWb
         SaI2DNdmRGbC8wt3AM0NyR0AUcpc/PgUPpSJUXvXYQ+Dx95/cIQxovaXXssijl1Mp0jj
         kMc18pxUYqK/k+8goQf/rgKq7l1gmdnHWgmo0M5Qb6y4ZrYDdwn02PUhcxOKepV9GDma
         Vc0r3cKIusKrk5InV0jAHZdMGp2MPm4Bq1VKaojJ/IDcr9m1FnLLjr6ytNjWgdtS+aOW
         33kg==
X-Forwarded-Encrypted: i=1; AJvYcCWpouO8+SBLjTNNBq2urnKmgcswQME2mFTwBYWb7CSdOewL/CzgLQ0R2/ukyZKzqVUoRDxcMCf69zpj0FWKfUh/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7EUo5PALFnhyuYF/XChwMguh32vTzYtWsS0UBdHQUC0sZ6OBE
	vj6+8gfn90iTpDPz/JmcuxYXmWFuwLAcETJ5I5cgTAh+ls3aDa6kng1I/lhn/6iq/faBsersQOL
	AL5RJxEkm5jTx9fHglfa3SFCXB7KjyxVXJEQyhe9gKn0FlBI8tU1Wj5f7L66ZSMIWhyyxKntR
X-Gm-Gg: ASbGncsBAIe0PumS4fmURsvaCMuUJUWr/DHZQzw/cpDsZ+fYuOhebNkAfwhiPgPYaEl
	pNDF80/CrP49WmOsNMjPD+FzgECI/owM37ZSG9eBmtRB3DanU6L23NI3noNNJRfjRZz596n35yQ
	Gq2dXxn6xF6gcI2sMlgeLvSvypNrwfLzTwAxoQqwazqym3d+zLju4BJy3y+Q7rpURgBPlmHazkH
	wOFNeqzr+yqJub48w+VNhgqIuT1LqVEIsEfr2V6AlXnlWqL+ScA7eQxtH362GDzOqYSSrMmYsYA
	92GVKBqj915sZiNxJWfWANvYb/UCQCMmhudo7ePFRTu/3G7EXOBgarB3EagV9zo5qV0=
X-Received: by 2002:a05:6a00:2350:b0:76e:885a:c3f2 with SMTP id d2e1a72fcca58-7702fc2d339mr2910853b3a.30.1755855022176;
        Fri, 22 Aug 2025 02:30:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPjl9du6NbhNGBRG4TzW7fpJP7yr3XTt7Akf+uqRroowTWYPJrBk6a36wmJwTgWdjLdbhyxg==
X-Received: by 2002:a05:6a00:2350:b0:76e:885a:c3f2 with SMTP id d2e1a72fcca58-7702fc2d339mr2910802b3a.30.1755855021746;
        Fri, 22 Aug 2025 02:30:21 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e894bc4d2sm8255639b3a.67.2025.08.22.02.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:30:21 -0700 (PDT)
Date: Fri, 22 Aug 2025 15:00:15 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] remoteproc: Move resource table data structure
 to its own header
Message-ID: <20250822093015.snkxlspg2czzrmgz@hu-mojha-hyd.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>
 <aKWDXySSt57tXHVP@linaro.org>
 <20250820151822.6cmowxfsheqxfrnb@hu-mojha-hyd.qualcomm.com>
 <20250820163250.hszey3i2gtd3o2i6@hu-mojha-hyd.qualcomm.com>
 <a59da8d7-4e35-4af5-8b9c-96aaf1597271@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a59da8d7-4e35-4af5-8b9c-96aaf1597271@kernel.org>
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a838af cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=DtrYIkIAubBs6YGxpE0A:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: E0TtUq12coV80IPYTlHxZ8gS09T3J_bD
X-Proofpoint-GUID: E0TtUq12coV80IPYTlHxZ8gS09T3J_bD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX3t85SPp4msJf
 opfeJlVZP1ul3Z74vUjN6S6Im+urvBVS10Z3XfJ5wJDDSMsF4garCTs9gNzuI7AP61Y/iC/CFjx
 JSrtKpgQrpVCDEE1iubKf0VIAEchtlSZfxtD8S5V5fr4LmkRjkOx2Xw6kKOCe5K3FdaaNvrkNDp
 5LpcsPOSr5bfMIvCIyOkUEv//bZOLnf51ocyRuFyV8Q0fKuiiw6ab9J6hlOSYYA877H9IBWmZS1
 uYZpnRrzOpcI0JysI2z1IH77039Gcw0GSAqzIrfX71NbJTWnXsq4lHvtPLXA2KRrOl+3apNd4/y
 QGlwXnDiFw4/PvNJaCUZZcBq22farXIKd29RfzMrpynIr5yMU8pVrqOumdbrpYUl9/RqMy1+fIr
 vXA1lW81q3XWJ0+ZM+RJVml10DCyaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 10:35:42AM +0200, Krzysztof Kozlowski wrote:
> On 20/08/2025 18:32, Mukesh Ojha wrote:
> >>
> >> -- 
> >> -Mukesh Ojha
> > 
> > Since I am not subscribed to any of the mailing lists to which this
> > series was sent, I am not receiving emails from the list. As a result,
> > your recent messages did not reach my inbox. Additionally, it seems your
> > reply inadvertently removed me from the To-list.
> 
> 
> You decided to remove your address from replies via "Mail-Followup-To:"
> header you introduced. It's on your email client.
> 
> Just like you will not receive this email (surprise!)...

This was not intentional and just a switch from mutt to neomutt where I
have added stuff unknowingly to filter things and showing inline replies
correctly that may have resulted into this.

> 
> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha
