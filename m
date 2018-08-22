Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55670 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbeHWARE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Aug 2018 20:17:04 -0400
Subject: Re: rproc_elf_load_segments: rproc_elf_load_segments elf loading
 problem
References: <CABViPYkb+g9GkJNVU6AUpzJRwLwZSD9PuxzDrDzgzb6Z0Ky1Gw@mail.gmail.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <4941e366-f41f-9b8f-8c23-b840a01b3970@ti.com>
Date: Wed, 22 Aug 2018 15:50:36 -0500
MIME-Version: 1.0
In-Reply-To: <CABViPYkb+g9GkJNVU6AUpzJRwLwZSD9PuxzDrDzgzb6Z0Ky1Gw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: dry@embedded-synergy.co.za, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Denis,

On 08/20/2018 12:40 AM, Denis Ryndine wrote:
> Hello,
> 
> The following may look like an error, could someone review.
> 
> In rproc_elf_load_segments:
> 
> /* grab the kernel address for this device address */
> ptr = rproc_da_to_va(rproc, da, memsz);
> 
> The last parameter should be filesz. Otherwise this call may fail, as
> the case when da is an address within a segment / memory.
> (E.g.  placing a RO data after the code within text segment /memory ).

No, it's alright, memsz >= filesz usually. The actual loadable content
will be filesz, the rest is zero initialized. Both these are from the
program headers. Have you seen some issues around this?

regards
Suman
