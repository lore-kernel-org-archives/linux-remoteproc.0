Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mga12.intel.com ([192.55.52.136]:57899 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409596AbgDPOGO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Apr 2020 10:06:14 -0400
Date: Thu, 16 Apr 2020 16:05:30 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: RPMSG over VirtIO under KVM
Message-ID: <20200416140307.GA25561@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

It has been proposed to port the VirtIO SOF driver [1], used to 
implement audio support under Linux, running in a KVM guest, to use 
RPMSG to communicate with the SOF vhost driver, running on the Linux 
host. On one hand I see an rpmsg-virtio driver, which should make such 
a port possible, on the other hand I don't see a single VirtIO driver 
in the kernel, using RPMSG for Linux virtualisation.

Hence my questions: is this a good idea? Is there anything in the 
kernel VirtIO RPMSG implementation, that would make this impossible?

Thanks
Guennadi

[1] https://thesofproject.github.io/latest/developer_guides/virtualization/virtualization.html
