Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F18FC433ED
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 May 2021 06:59:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45F8161164
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 May 2021 06:59:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234242AbhEGHAl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 May 2021 03:00:41 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:60390 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232929AbhEGHAk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 May 2021 03:00:40 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1476iMhu036236;
        Fri, 7 May 2021 06:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=NLt75eU9eLN2IJIrAJZKscDO9v/2qVIuCz9o9l+6l8A=;
 b=h6SrhnpPMkIRPZ2wTyD5nBVcd5hlmjFFdJhOKiOn9V8IWVFWNf63B48fvRcpHfEqN4PZ
 Zh16kcs2sXKEwIC+mrUp1GSOiJNDOLf38Tw6Njfl07eEtTpFHQ8j0TnMgWieMPG5glf3
 PVPvjlGOk2uSC6lkXExv6LQXFdQmMqb6XJrw+yq6+8w+pHVJQBGr/XeyeJLMfn1aHump
 MiSw+4jN1U3+G8Yzg+PpjQnlizXhERiGveTdHyXJiTciH11+a4zAD6xliGkpnJK4tKnV
 k4oSBk9DJVFmHqMSjNPfFARxz8xxqpXuLUC4VEfoQppWnbpj+bBFW/cDSI+2npSyJA/N yg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 38ctjv0gwn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 May 2021 06:59:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1476jNmP172193;
        Fri, 7 May 2021 06:59:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38css88w12-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 May 2021 06:59:36 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1476xaiW021697;
        Fri, 7 May 2021 06:59:36 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 38css88w0n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 May 2021 06:59:36 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 1476xXjp009800;
        Fri, 7 May 2021 06:59:34 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 06 May 2021 23:59:33 -0700
Date:   Fri, 7 May 2021 09:59:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: k3-r5: Fix an error message
Message-ID: <20210507065926.GD1922@kadam>
References: <d6e29d903b48957bf59c67229d54b0fc215e31ae.1620333870.git.christophe.jaillet@wanadoo.fr>
 <20210507052647.GF1955@kadam>
 <5cdff9cf-945a-fe47-b117-3c9d9f11e987@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cdff9cf-945a-fe47-b117-3c9d9f11e987@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: 9Rf_BUuJtuVZaloj1SpHtav1GeENaC2C
X-Proofpoint-GUID: 9Rf_BUuJtuVZaloj1SpHtav1GeENaC2C
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070048
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, May 07, 2021 at 07:58:39AM +0200, Christophe JAILLET wrote:
> Le 07/05/2021 à 07:26, Dan Carpenter a écrit :
> > On Thu, May 06, 2021 at 10:46:01PM +0200, Christophe JAILLET wrote:
> > > 'ret' is known to be 0 here.
> > > Reorder the code so that the expected error code is printed.
> > > 
> > > Fixes: 6dedbd1d5443 ("remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > >   drivers/remoteproc/ti_k3_r5_remoteproc.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > > index 5cf8d030a1f0..4104e4846dbf 100644
> > > --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > > +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > > @@ -1272,9 +1272,9 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
> > >   	core->tsp = k3_r5_core_of_get_tsp(dev, core->ti_sci);
> > >   	if (IS_ERR(core->tsp)) {
> > > +		ret = PTR_ERR(core->tsp);
> > >   		dev_err(dev, "failed to construct ti-sci proc control, ret = %d\n",
> > >   			ret);
> > 
> > I recently learned about the %pe format specifier, which prints "-ENOMEM"
> > instead of -12.
> 
> Hi Dan,
> 
> I see that we are reading the same ML  :)
> 
> 
> Well, I'm a bit puzzled by it.
> On one hand, it is more user-friendly. On the other hand it is not widely
> used up to now.
> 
> So is it better to keep the legacy way of reporting error code?

It might make back porting things more complicated?  I'm surprised this
hasn't been backported further back to 5.4.

> 
> Do you know if there is preferred way?

It's new.  Soon it will be the prefered way.  You're right, of course,
that needs to introduce a %e which takes an int.  I have left this as an
exercise for the reader.  ;)  Eventually someone will work up the energy
required and do this work.

regards,
dan carpenter

