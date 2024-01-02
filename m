Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5611715AD1
	for <linux-remoteproc@vger.kernel.org>; Tue,  2 Jan 2024 18:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jZC5r718"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5ceb02e2a56so232597a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Jan 2024 10:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704221009; x=1704825809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TaONoZrD0ZXDI3Lt3Dsqe7USkZEV330FXykpfUE9/Tc=;
        b=jZC5r7183hT5R//7RoN7lIv6Yr/F2fM1ijLnRbjlQ8qslmTnvvwx1kXGbcFsTopHvg
         DeX1WVGfb60CvONygifD5Jcigsk30/0KJheqkzs2LOTkUeVK/9fof7yb9DIJ/6Lxr3PB
         Gd45FfdUa9P9S0Srm8Q2hqMcXxVuVotJZFalQNgN+/ICiObC6QDldrFcNX8+gl/DMLel
         nBXP09xp25MwED4aHEmdc9eqUj1B+rK2K0zXxyW2lb+BI29VG48+umFWPZddj4eCo+9M
         nVz8R+Eff/q6x6Vq+U4ByKTpn5PrUHFVeguQ+m36ClDFGTLZVNpndbXzB/6C3IaexmE4
         D31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704221009; x=1704825809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaONoZrD0ZXDI3Lt3Dsqe7USkZEV330FXykpfUE9/Tc=;
        b=HoYbDAk5xisg9LYg+FI9f8dkl+pLwIas8QWTfxVRYyJtOOpSllCpLAfi988YfQm9Ep
         9B+tfkEISxMtZ8vftX4lMlG+jfPsr8t68vBvSEpN5whouaeZbEGj+p1GXcVjsyLm1zU6
         qfXNTkaNp7B11ZJXvOhin/2do8K+4LlcfAFSnA/f8Ort77GAQVq2B7kMxfYHyP3GupmD
         9xMna+8q6gqPDrid5P7ZhIqGvt8Nb94VpRclOhLYOnip7LZ+QGBeJzTJutrY6iic/mWZ
         y64LVe+1rRPMEE//IQREjhVC9/W+OBQemaHtiURpNwA4G1cRFw+JwQ2fUhqNkXJrjMjL
         EbNQ==
X-Gm-Message-State: AOJu0YwBNADMZA/eCNc+VODH8ROX5tdd1YTp6dsMwDIUdGdnX3eXySeL
	xP6TjXVyZoEKd5WB9FtH10Dik2eIFl7lww==
X-Google-Smtp-Source: AGHT+IGUmDLn4EONUunNPGVyYG1zJzUtuOfZAY6a+sBXNVDTo1Xft0+IBiIrvaOI3awoalBXquOHtg==
X-Received: by 2002:a05:6a20:244a:b0:196:82d2:4e6a with SMTP id t10-20020a056a20244a00b0019682d24e6amr2764622pzc.74.1704221009668;
        Tue, 02 Jan 2024 10:43:29 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:2dba:4fab:fb9:7d99])
        by smtp.gmail.com with ESMTPSA id x2-20020aa784c2000000b006d99cbe22f5sm17477199pfn.217.2024.01.02.10.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 10:43:29 -0800 (PST)
Date: Tue, 2 Jan 2024 11:43:27 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ben Levinsky <ben.levinsky@amd.com>
Subject: Re: [RESEND PATCH v3 1/2] remoteproc: Make rproc_get_by_phandle()
 work for clusters
Message-ID: <ZZRZT8Dtg10oZcJQ@p14s>
References: <20231014231548.637303-1-tanmay.shah@amd.com>
 <20231014231548.637303-2-tanmay.shah@amd.com>
 <dznmvir337tb455usswkrvovf34urgyejkrt7rduscbepd2wg3@7atos56utizw>
 <CANLsYky+6=tvAHE408pGg_=YTUM4eH6ovwn--h2iuaNMGwRF+Q@mail.gmail.com>
 <d491221f-1911-432f-9afb-45c4ac5287b4@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d491221f-1911-432f-9afb-45c4ac5287b4@amd.com>

On Wed, Dec 20, 2023 at 08:47:19AM -0600, Tanmay Shah wrote:
> 
> On 11/14/23 10:23 AM, Mathieu Poirier wrote:
> > On Tue, 14 Nov 2023 at 08:22, Bjorn Andersson <andersson@kernel.org> wrote:
> > >
> > > On Sat, Oct 14, 2023 at 04:15:47PM -0700, Tanmay Shah wrote:
> > > > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > >
> > > > Multi-cluster remoteproc designs typically have the following DT
> > > > declaration:
> > > >
> > > >       remoteproc_cluster {
> > > >               compatible = "soc,remoteproc-cluster";
> > > >
> > > >                 core0: core0 {
> > > >                       compatible = "soc,remoteproc-core"
> > > >                         memory-region;
> > > >                         sram;
> > > >                 };
> > > >
> > > >                 core1: core1 {
> > > >                       compatible = "soc,remoteproc-core"
> > > >                         memory-region;
> > > >                         sram;
> > > >                 }
> > > >         };
> > > >
> > > > A driver exists for the cluster rather than the individual cores
> > > > themselves so that operation mode and HW specific configurations
> > > > applicable to the cluster can be made.
> > > >
> > > > Because the driver exists at the cluster level and not the individual
> > > > core level, function rproc_get_by_phandle() fails to return the
> > > > remoteproc associated with the phandled it is called for.
> > > >
> > > > This patch enhances rproc_get_by_phandle() by looking for the cluster's
> > > > driver when the driver for the immediate remoteproc's parent is not
> > > > found.
> > > >
> > > > Reported-by: Ben Levinsky <ben.levinsky@xilinx.com>
> > > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > Tested-by: Ben Levinsky <ben.levinsky@amd.com>
> > > > ---
> > > >  drivers/remoteproc/remoteproc_core.c | 28 +++++++++++++++++++++++++++-
> > > >  1 file changed, 27 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > > index 695cce218e8c..3a8191803885 100644
> > > > --- a/drivers/remoteproc/remoteproc_core.c
> > > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > > @@ -33,6 +33,7 @@
> > > >  #include <linux/idr.h>
> > > >  #include <linux/elf.h>
> > > >  #include <linux/crc32.h>
> > > > +#include <linux/of_platform.h>
> > > >  #include <linux/of_reserved_mem.h>
> > > >  #include <linux/virtio_ids.h>
> > > >  #include <linux/virtio_ring.h>
> > > > @@ -2111,7 +2112,9 @@ EXPORT_SYMBOL(rproc_detach);
> > > >  #ifdef CONFIG_OF
> > > >  struct rproc *rproc_get_by_phandle(phandle phandle)
> > > >  {
> > > > +     struct platform_device *cluster_pdev;
> > > >       struct rproc *rproc = NULL, *r;
> > > > +     struct device_driver *driver;
> > > >       struct device_node *np;
> > > >
> > > >       np = of_find_node_by_phandle(phandle);
> > > > @@ -2122,7 +2125,30 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
> > > >       list_for_each_entry_rcu(r, &rproc_list, node) {
> > > >               if (r->dev.parent && device_match_of_node(r->dev.parent, np)) {
> > > >                       /* prevent underlying implementation from being removed */
> > > > -                     if (!try_module_get(r->dev.parent->driver->owner)) {
> > > > +
> > > > +                     /*
> > > > +                      * If the remoteproc's parent has a driver, the
> > > > +                      * remoteproc is not part of a cluster and we can use
> > > > +                      * that driver.
> > > > +                      */
> > > > +                     driver = r->dev.parent->driver;
> > > > +
> > > > +                     /*
> > > > +                      * If the remoteproc's parent does not have a driver,
> > > > +                      * look for the driver associated with the cluster.
> > > > +                      */
> > > > +                     if (!driver) {
> > > > +                             cluster_pdev = of_find_device_by_node(np->parent);
> > >
> > > Both the Ti and Xilinx drivers are using of_platform_populate(), so
> > > their r->dev.parent should have a parent reference to the cluster
> > > device.
> > >
> >
> > So you are proposing to get the cluster's driver using something like
> > r->dev.parent->parent->driver?
> >
> > I will have to verify the parent/child relationship is set up properly
> > through the of_platform_populate().  If it is, following the pointer
> > trail is an equally valid approach and I will respin this set.
> 
> 
> Hi Mathieu,
> 
> I addressed Bjorn's comments and verified on ZynqMP hardware that it's working.
> 
> Let me know if you would like to see v4 with suggested changes.
>

Yes, please send a V4 with the proposed changes.

> 
> Thanks,
> 
> Tanmay
> 
> > > Unless I'm reading the code wrong, I think we should follow that
> > > pointer, rather than taking the detour in the DeviceTree data.
> > >
> > > Regards,
> > > Bjorn
> > >
> > > > +                             if (!cluster_pdev) {
> > > > +                                     dev_err(&r->dev, "can't get parent\n");
> > > > +                                     break;
> > > > +                             }
> > > > +
> > > > +                             driver = cluster_pdev->dev.driver;
> > > > +                             put_device(&cluster_pdev->dev);
> > > > +                     }
> > > > +
> > > > +                     if (!try_module_get(driver->owner)) {
> > > >                               dev_err(&r->dev, "can't get owner\n");
> > > >                               break;
> > > >                       }
> > > > --
> > > > 2.25.1
> > > >
