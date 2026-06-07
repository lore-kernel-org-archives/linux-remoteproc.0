Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E1D31AA94
	for <linux-remoteproc@vger.kernel.org>; Sun,  7 Jun 2026 20:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780862744; cv=none; b=JENqB/4RgvCIxD605vbPbjEyjAU69xtrbuICna1Sn46IiL0PRAin3z0Fl9fe0dVJUZRHOwxwbq5JczPIRH8g8YIlSh7K50B6TlKrBkKBr0hdLsPJt+j7ZJa0N1NvP3RciD17V6rS3lRqoophKQyLGwvdZsKzxKWe5xm8k0qnaeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780862744; c=relaxed/simple;
	bh=XQ8o4XBTJzUDBh/1MscbS0zEhaWU3W991BV504tZT4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVQoz/T2yHlBZKvo6iAdBGScLlqjqNV2e9VL+mxjRe5dMQgTAjJbp777ghCoQMIq6atwqN5LxC+V7ygdlhcB9IDx5rl9LpqgFQOyY8w34Lp8m9339zgDxX+cIWKJfNu07c1jHnvYsHo3AKYIhsdAtzQdbbugkXV5Y/WaLXJMHb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brMLMMUG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dn4w8gY5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brMLMMUG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dn4w8gY5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElOsd827747
	for <linux-remoteproc@vger.kernel.org>; Sun, 7 Jun 2026 20:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fr4ZlPnDKIU8+Rj+BrsRCW9TbgLRUVGk8aHsSLkO0Tk=; b=brMLMMUGXXohbJ1e
	lOyG9m2BQXaQHxr7u8SetuNfzj9WqJ5z6kIEaLBjsUh/8rpp4c7gF7yBHQtvJcDi
	Gl1wPwNX2T/jiaEAEBaC+QCl0pHXDJw1mUNmPSaBL4YDp2ktqBSuXmb+FozeeMTO
	2U8XZ0LVYS8VBr+BcKv2bBk/9tbE6M85gxD+srqtgkyqYR31VfIFe74L75ZFwaoa
	QoTFRs5XWO1JO1bN8yXHs5YEURNBOyNUKvGAcGraQYORu3tpvv7QRCUqKR8e8N/L
	RChT0mRiLI/XrJsMVmLnGaLEkyh7FresUfTRIvdn5SdFK3ABLQhg9tJ+6NgvkuqX
	RbMNaA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6ck8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 07 Jun 2026 20:05:40 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cc5ae9b959so4369376137.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 07 Jun 2026 13:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780862740; x=1781467540; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fr4ZlPnDKIU8+Rj+BrsRCW9TbgLRUVGk8aHsSLkO0Tk=;
        b=Dn4w8gY54VwBcMt8WbOsJA5K9WQnNTF0wIlMMGXf/Fnu2TS79S6khBLEJxnnE/qiyF
         9uEPtituHk0xTF1nLas5ea5Oc7w6UmhxFj/k4WQmNDe+KatlC+oYdHouuojTkcLGEiBL
         uyckG1m+Tz3Xpen1yT9A7MAXkT+V/uvsmZABX7sIl6d0FO+YSybTrrjbh7OTx/tQaKan
         dMN2tfs78pFM+Kvad73vzrnkGNpe5zacSBFASCP8lom8ZXU5m9pxaMXmoCm6tkR/kEw4
         GcooNpF1TXHYdShZ9EYL441OsGd7gnCRtrDrZgEnMLIhvsyYO15wLk0UrF8dhvvgeLEm
         m0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780862740; x=1781467540;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr4ZlPnDKIU8+Rj+BrsRCW9TbgLRUVGk8aHsSLkO0Tk=;
        b=IH4ncQIhN/08XNg3jh43qoT6m2ayr6T+vGEn4KefRYFQKKigVcVh0XPQ/x8fXLgn0n
         SHjGUGht93sh6GV/K3EUpnGtvYuDqcwno4Es+X6gvfdylPtZdAuF9jthCpwHl4Gofw+T
         c9HRDdAOCIZk2plrVk4iCVP6QxzhUlEg+/Cd416etEC9FdML2meVGMBhEyjLa4YWbXB0
         hRU4IaXzl2yDbU+ih5O9fl2ZpeYvkOyudUnYFfD4A+o3wwYxFVMW/8F9kKBRCzhgu4nl
         D0S9VlvQ9EJ4daixAsZaC3FU7URBFOrHJntsvbO4YWHb1RJSIYqkeyuYEqBlnAZGwChL
         qjCA==
X-Forwarded-Encrypted: i=1; AFNElJ/Uq6chFb8reBlqEJF2G1ceBBXfbnOW5dpUulUL4t30GAICDDEVMV+T87rKY3TbrK4eGZXxlAvxjK84y/yFFSPk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ftR9R+9i0oFb0dqE58v6sRdp5wgQHAIOFDSqTz4sBfwQ0kEE
	BKOe3eUPXzjBWAyjMlXUnsgHEJ8qn99Ey5z5sVfz3b4Vmafk9b9RBFeyJQ+TRx/IPvxc16AASH4
	1PEzyFP/6/G6fVQXYnlQYy5OesKG6Fh1XS+4YZ2i2AJuCupz5g2udbHuW+6SG3VSOctSoV19O
X-Gm-Gg: Acq92OFBqVLvQkbE5NI669Y/yywc3/t026u7B0rNjNu9yIFEUW/8ZrnGt7LTvuOumbK
	R06tGu/4DQdn7kFL+v6uKoX7XNXtaS/3W8j+yr1HrPM+0n7QicmSplTll3FS3i0ME4ZCLIDOiAi
	J6J01gscf1jajocGNAtEsUh/nfyXWB8nXaW6IbFk4psI6BIiMWNa5RMgjKZyYIeY443nOL6z9OI
	ftFvO0tuCzeM2a8cAjYq5L4OVMAUGXpRYd2KZ3wNjMQE39Z+5fD1jK+WKlBYt2p87iMlVruY8na
	qw8aNfUyhj2TXEEmczI19+g/Kd5ubXAexiI9/twK2SPl7LIMMIs+RDmcuJNr7kPMiH4KjuH4Fjs
	TbEln/9iqJ2ormJxAsUEAcpyd+RLdYPPY0iss6BUgfvS70/zIDfA/hGW0as3mXFhbCPo6rbGZ58
	hyuFELTJO2CVM/fVzex2G83R6j5swEks7+IqrshH4LJusteA==
X-Received: by 2002:a05:6102:809b:b0:6ef:f681:d914 with SMTP id ada2fe7eead31-6fefb0a250bmr6109560137.22.1780862739844;
        Sun, 07 Jun 2026 13:05:39 -0700 (PDT)
X-Received: by 2002:a05:6102:809b:b0:6ef:f681:d914 with SMTP id ada2fe7eead31-6fefb0a250bmr6109552137.22.1780862739462;
        Sun, 07 Jun 2026 13:05:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b904207sm3257219e87.32.2026.06.07.13.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:05:38 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:05:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH] rpmsg: glink: fix deadlock in endpoint destroy during
 driver detach
Message-ID: <j55nm6bcbwrmynrj3ig7azail5aoxmjaurbzbdcmpink7c6mh6@va26vzo3y7ey>
References: <20260604-rpmsg-glink-fix-deadlock-destroy-ept-v1-1-b8a54ad1e4fd@oss.qualcomm.com>
 <3896c47d-41c0-4b61-a115-c5d6ea282fa5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3896c47d-41c0-4b61-a115-c5d6ea282fa5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a25cf14 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=tuoRKqVBAySZye6t0SgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMSBTYWx0ZWRfX+3sm+r8leV9q
 8szuR3Q3iryejCtxG2Cei9ItP5X0xhRIYBEowktljsnGBf6JqU2Ogr5uNb26DYKx8O0TXWhJzos
 IChRzpIo5J+JyqjbZhnX4zBlCt2zlfd1xf/VO+GjKLbxaHvWJDHvokH2qSYcMPw7lE9YO6b3uHK
 xfOBR59D+J3ryOkNqCUKicQKT0dtOWofFdCaUY7XLYNkyc21NuNyXcmg+VrbSbpC2X+DeIlqZXb
 5IzvHd4y3RqR+0k5wyZxzDgmmsXs2+tf4w5gSQddO/aDyA916k4ObM5kza1ZRwFXqqRDHdzFja5
 USQHcpq+pf1WU6pIuxY+9kvEVcmx0I393BMcAS+Y6coKCGIURtxmTVVtR5i3E0hVqvaa7vlbK6l
 Z0Ngrk5toPeMo1zrabe+bkN/bvjA7bmcYf9Qbwn9gp+xRFVYP+u3BwGyrLXI2KoP9e2nQkg4ASk
 c25F4CL/ZzcQYVmEO9Q==
X-Proofpoint-GUID: N4dHfu2IB6-sBvuLprV5OX9nAuDTCiA-
X-Proofpoint-ORIG-GUID: N4dHfu2IB6-sBvuLprV5OX9nAuDTCiA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070201

On Fri, Jun 05, 2026 at 09:17:19AM +0800, Jie Gan wrote:
> 
> 
> On 6/4/2026 4:42 PM, Vishnu Santhosh wrote:
> > During driver detach, the device core holds the device mutex throughout
> > the driver's remove callback chain.  When the rpmsg endpoint is
> > destroyed as part of that teardown, the GLINK endpoint destroy
> > implementation attempts to unregister the underlying rpmsg device.
> > That unregistration calls device_del(), which tries to re-acquire the
> > same device mutex already held higher up the stack, causing rmmod to
> > hang indefinitely.
> > 
> > The deadlock manifests with the following call chain:
> > 
> > [<0>] device_del+0x44/0x414  <- tries to acquire same mutex
> > [<0>] device_unregister+0x18/0x34
> > [<0>] rpmsg_unregister_device+0x28/0x4c
> > [<0>] qcom_glink_remove_rpmsg_device+0x70/0xc0
> > [<0>] qcom_glink_destroy_ept+0x58/0xbc
> > [<0>] rpmsg_dev_remove+0x50/0x60
> > [<0>] device_remove+0x4c/0x80
> > [<0>] device_release_driver_internal+0x1cc/0x228  <- acquires device mutex
> > [<0>] driver_detach+0x4c/0x98
> > [<0>] bus_remove_driver+0x6c/0xbc
> > [<0>] driver_unregister+0x30/0x60
> > [<0>] unregister_rpmsg_driver+0x10/0x1c
> > [<0>] fastrpc_exit+0x28/0x38 [fastrpc]
> > [<0>] __arm64_sys_delete_module+0x1b8/0x294
> > [<0>] invoke_syscall+0x48/0x10c
> > [<0>] el0_svc_common.constprop.0+0xc0/0xe0
> > [<0>] do_el0_svc+0x1c/0x28
> > [<0>] el0_svc+0x34/0x108
> > [<0>] el0t_64_sync_handler+0xa0/0xe4
> > [<0>] el0t_64_sync+0x198/0x19c
> > 
> > The rpmsg device unregistration inside endpoint destroy is redundant.
> > In both contexts where endpoint destruction is triggered:
> > 
> > - Driver detach path: the driver core already tears down the rpmsg
> >    device.
> > 
> > - Channel close path: the rpmsg device is already unregistered before
> >    endpoint destruction is reached.
> > 
> > Remove the redundant unregistration to fix the deadlock.
> > 
> 
> Fixes: a53e356df548 ("rpmsg: glink: fix rpmsg device leak")
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
